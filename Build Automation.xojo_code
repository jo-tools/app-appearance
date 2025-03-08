#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin SignProjectStep Sign
				  DeveloperID=
				  macOSEntitlements={"App Sandbox":"False","Hardened Runtime":"False","Notarize":"False","UserEntitlements":""}
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
				Begin IDEScriptBuildStep AzureTrustedSigning , AppliesTo = 0, Architecture = 0, Target = 0
					'**************************************************
					' CodeSign | Azure Trusted Signing | Docker
					'**************************************************
					' https://github.com/jo-tools/ats-codesign
					'**************************************************
					' Requirements
					'**************************************************
					' 1. Set up Azure Trusted Signing
					' 2. Have Docker up and running
					' 3. Read the comments in this Post Build Script,
					' 4. Modify it according to your needs.
					'
					'    Especially look out for sDOCKER_EXE
					'    You might need to set the full path to the executable
					'**************************************************
					' 5. If it's working for you:
					'    Do you like it? Does it help you? Has it saved you time and money?
					'    You're welcome - it's free...
					'    If you want to say thanks I appreciate a message or a small donation.
					'    Contact: xojo@jo-tools.ch
					'    PayPal:  https://paypal.me/jotools
					'**************************************************
					
					'**************************************************
					' Note: Xojo IDE running on Linux
					'**************************************************
					' Make sure that docker can be run without requiring 'sudo':
					' More information e.g. in this article:
					' https://medium.com/devops-technical-notes-and-manuals/how-to-run-docker-commands-without-sudo-28019814198f
					' 1. sudo groupadd docker
					' 2. sudo gpasswd -a $USER docker
					' 3. (reboot)
					'**************************************************
					
					If DebugBuild Then Return 'don't CodeSign DebugRun's
					
					' bSILENT=True : don't show any messages until checking configuration
					'                once .json required files are found: expect Docker and codesign to work
					Var bSILENT As Boolean = True
					
					'Check Build Target
					Select Case CurrentBuildTarget
					Case 3 'Windows (Intel, 32Bit)
					Case 19 'Windows (Intel, 64Bit)
					Case 25 'Windows(ARM, 64Bit)
					Else
					If (Not bSILENT) Then Print "AzureTrustedSigning: Unsupported Build Target"
					Return
					End Select
					
					'Don't CodeSign Development and Alpha Builds
					Select Case PropertyValue("App.StageCode")
					Case "0" 'Development
					If (Not bSILENT) Then Print "AzureTrustedSigning: Not enabled for Development Builds"
					Return
					Case "1" 'Alpha
					If (Not bSILENT) Then Print "AzureTrustedSigning: Not enabled for Alpha Builds"
					Return
					Case "2" 'Beta
					Case "3" 'Final
					End Select
					
					'Configure what to be CodeSigned
					Var sSIGN_FILES() As String
					
					Select Case PropertyValue("App.StageCode")
					Case "3" 'Final
					'sign all .exe's and all .dll's
					sSIGN_FILES.Add("""./**/*.exe""") 'recursively all .exe's
					sSIGN_FILES.Add("""./**/*.dll""") 'recursively all .dll's
					Else
					'only sign all .exe's for Beta/Alpha/Development builds
					sSIGN_FILES.Add("""./**/*.exe""") 'recursively all .exe's
					End Select
					
					Var sDOCKER_IMAGE As String = "jotools/ats-codesign"
					Var sFILE_ACS_JSON As String = ""
					Var sFILE_AZURE_JSON As String = ""
					Var sBUILD_LOCATION As String = CurrentBuildLocation
					
					'Check Environment
					Var sDOCKER_EXE As String = "docker"
					If TargetWindows Then 'Xojo IDE is running on Windows
					sFILE_ACS_JSON = DoShellCommand("if exist %USERPROFILE%\.ats-codesign\acs.json echo %USERPROFILE%\.ats-codesign\acs.json").Trim
					sFILE_AZURE_JSON = DoShellCommand("if exist %USERPROFILE%\.ats-codesign\azure.json echo %USERPROFILE%\.ats-codesign\azure.json").Trim
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					sDOCKER_EXE = DoShellCommand("[ -f /usr/local/bin/docker ] && echo /usr/local/bin/docker").Trim
					If (sDOCKER_EXE = "") Then sDOCKER_EXE = DoShellCommand("[ -f /snap/bin/docker ] && echo /snap/bin/docker").Trim
					sFILE_ACS_JSON = DoShellCommand("[ -f ~/.ats-codesign/acs.json ] && echo ~/.ats-codesign/acs.json").Trim
					sFILE_AZURE_JSON = DoShellCommand("[ -f ~/.ats-codesign/azure.json ] && echo ~/.ats-codesign/azure.json").Trim
					sBUILD_LOCATION = sBUILD_LOCATION.ReplaceAll("\", "") 'don't escape Path
					Else
					If (Not bSILENT) Then Print "AzureTrustedSigning: Xojo IDE running on unknown Target"
					Return
					End If
					
					If (sFILE_ACS_JSON = "") Or (sFILE_AZURE_JSON = "") Then
					If (Not bSILENT) Then Print "AzureTrustedSigning: acs.json and azure.json not found in [UserHome]-[.ats-codesign]-[acs|azure.json]"
					Return
					End If
					
					'Check Docker
					Var iCHECK_DOCKER_RESULT As Integer
					Var sCHECK_DOCKER_EXE As String = DoShellCommand(sDOCKER_EXE + " --version", 0, iCHECK_DOCKER_RESULT).Trim
					If (iCHECK_DOCKER_RESULT <> 0) Or (Not sCHECK_DOCKER_EXE.Contains("Docker")) Or (Not sCHECK_DOCKER_EXE.Contains("version")) Or (Not sCHECK_DOCKER_EXE.Contains("build "))Then
					Print "AzureTrustedSigning: Docker not available"
					Return
					End If
					
					Var sCHECK_DOCKER_PROCESS As String = DoShellCommand(sDOCKER_EXE + " ps", 0, iCHECK_DOCKER_RESULT).Trim
					If (iCHECK_DOCKER_RESULT <> 0) Then
					Print "AzureTrustedSigning: Docker not running"
					Return
					End If
					
					'CodeSign in Docker Container
					For i As Integer = sSIGN_FILES.LastIndex DownTo 0
					sSIGN_FILES(i) = sSIGN_FILES(i).ReplaceAll("""", "\""")
					Next
					
					Var sSIGN_COMMAND As String = _
					sDOCKER_EXE + " run " + _
					"--rm " + _
					"-v """ + sFILE_ACS_JSON + """:/etc/ats-codesign/acs.json " + _
					"-v """ + sFILE_AZURE_JSON + """:/etc/ats-codesign/azure.json " + _
					"-v """ + sBUILD_LOCATION + """:/data " + _
					"-w /data " + _
					sDOCKER_IMAGE + " " + _
					"/bin/sh -c ""ats-codesign.sh " + String.FromArray(sSIGN_FILES, " ")+ """"
					
					Var iSIGN_RESULT As Integer
					Var sSIGN_OUTPUT As String = DoShellCommand(sSIGN_COMMAND, 0, iSIGN_RESULT)
					
					If (iSIGN_RESULT <> 0) Then
					Print "AzureTrustedSigning: ats-codesign Error" + EndOfLine + EndOfLine + _
					sSIGN_OUTPUT.Trim + EndOfLine + _
					"[ExitCode: " + iSIGN_RESULT.ToString + "]"
					
					If (iSIGN_RESULT <> 125) Then
					Var iCHECK_DOCKERIMAGE_RESULT As Integer
					Var sCHECK_DOCKERIMAGE_OUTPUT As String = DoShellCommand(sDOCKER_EXE + " image inspect " + sDOCKER_IMAGE, 0, iCHECK_DOCKERIMAGE_RESULT)
					If (iCHECK_DOCKERIMAGE_RESULT <> 0) Then
					Print "AzureTrustedSigning: Docker Image '" + sDOCKER_IMAGE + "' not available"
					End If
					End If
					End If
					
				End
			End
#tag EndBuildAutomation
