#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
				Begin IDEScriptBuildStep CreateTGZ , AppliesTo = 2, Architecture = 0, Target = 0
					'**************************************************
					' Create .tgz for Linux Builds
					'**************************************************
					' https://github.com/jo-tools
					'**************************************************
					' 1. Read the comments in this PostBuild Script
					' 2. Edit the values according to your needs
					'**************************************************
					' 3. If it's working for you:
					'    Do you like it? Does it help you? Has it saved you time and money?
					'    You're welcome - it's free...
					'    If you want to say thanks I appreciate a message or a small donation.
					'    Contact: xojo@jo-tools.ch
					'    PayPal:  https://paypal.me/jotools
					'**************************************************
					
					If DebugBuild Then Return 'don't create .tgz for DebugRuns
					
					' bSILENT=True : don't show any error messages
					Var bSILENT As Boolean = False
					
					'Check Build Target
					Select Case CurrentBuildTarget
					Case 4 'Linux (Intel, 32Bit)
					Case 17 'Linux (Intel, 64Bit)
					Case 18 'Linux (ARM, 32Bit)
					Case 26 'Linux (ARM, 64Bit)
					Else
					If (Not bSILENT) Then Print "CreateTGZ: Unsupported Build Target"
					Return
					End Select
					
					'Xojo Project Settings
					Var sPROJECT_PATH As String
					Var sBUILD_LOCATION As String = CurrentBuildLocation
					Var sAPP_NAME As String = CurrentBuildAppName
					Var sCHAR_FOLDER_SEPARATOR As String
					If TargetWindows Then 'Xojo IDE is running on Windows
					sPROJECT_PATH = DoShellCommand("echo %PROJECT_PATH%", 0).Trim
					sCHAR_FOLDER_SEPARATOR = "\"
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					sPROJECT_PATH = DoShellCommand("echo $PROJECT_PATH", 0).Trim
					If sPROJECT_PATH.Right(1) = "/" Then
					'no trailing /
					sPROJECT_PATH = sPROJECT_PATH.Left(sPROJECT_PATH.Length - 1)
					End If
					If sBUILD_LOCATION.Right(1) = "/" Then
					'no trailing /
					sBUILD_LOCATION = sBUILD_LOCATION.Left(sBUILD_LOCATION.Length - 1)
					End If
					sBUILD_LOCATION = sBUILD_LOCATION.ReplaceAll("\", "") 'don't escape Path
					sCHAR_FOLDER_SEPARATOR = "/"
					End If
					
					If (sPROJECT_PATH = "") Then
					If (Not bSILENT) Then Print "CreateTGZ: Could not get the Environment Variable PROJECT_PATH from the Xojo IDE." + EndOfLine + EndOfLine + "Unfortunately, it's empty.... try again after re-launching the Xojo IDE and/or rebooting your machine."
					Return
					End If
					
					'Check Stage Code for TGZ Filename
					Var sSTAGECODE_SUFFIX As String
					Select Case PropertyValue("App.StageCode")
					Case "0" 'Development
					sSTAGECODE_SUFFIX = "-dev"
					Case "1" 'Alpha
					sSTAGECODE_SUFFIX = "-alpha"
					Case "2" 'Beta
					sSTAGECODE_SUFFIX = "-beta"
					Case "3" 'Final
					'not used in filename
					End Select
					
					'Build TGZ Filename
					Var sTGZ_FILENAME As String
					Select Case CurrentBuildTarget
					Case 4 'Linux (Intel, 32Bit)
					sTGZ_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Linux_Intel_32Bit.tgz"
					Case 17 'Linux (Intel, 64Bit)
					sTGZ_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Linux_Intel_64Bit.tgz"
					Case 18 'Linux (ARM, 32Bit)
					sTGZ_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Linux_ARM_32Bit.tgz"
					Case 26 'Linux (ARM, 64Bit)
					sTGZ_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Linux_ARM_64Bit.tgz"
					Else
					Return
					End Select
					
					'Create .tgz
					Var sPATH_PARTS() As String = sBUILD_LOCATION.Split(sCHAR_FOLDER_SEPARATOR)
					Var sAPP_FOLDERNAME As String = sPATH_PARTS(sPATH_PARTS.LastIndex)
					If TargetWindows Then sAPP_FOLDERNAME = sAPP_NAME 'on Windows, BuildLocation is short shell path (e.g. APPNAM~1)
					sPATH_PARTS.RemoveAt(sPATH_PARTS.LastIndex)
					Var sFOLDER_BASE As String = String.FromArray(sPATH_PARTS, sCHAR_FOLDER_SEPARATOR)
					
					Var sTGZ_PARAMS_MACOS As String = If(TargetMacOS, "--no-mac-metadata --no-xattrs", "")
					Var sTGZ_COMMAND As String = "cd """ + sFOLDER_BASE + """ && tar -c -z -v " + sTGZ_PARAMS_MACOS + " -f "".." + sCHAR_FOLDER_SEPARATOR + sTGZ_FILENAME + """ ""." + sCHAR_FOLDER_SEPARATOR + sAPP_FOLDERNAME + """"
					
					Var iTGZ_RESULT As Integer
					Var sTGZ_OUTPUT As String = DoShellCommand(sTGZ_COMMAND, 0, iTGZ_RESULT)
					If (iTGZ_RESULT <> 0) Then
					If (Not bSILENT) Then Print "CreateTGZ Error" + EndOfLine + EndOfLine + _
					sTGZ_OUTPUT.Trim + EndOfLine + _
					"[ExitCode: " + iTGZ_RESULT.ToString + "]"
					End If
					
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin SignProjectStep Sign
				  DeveloperID=
				  macOSEntitlements={"App Sandbox":"False","Hardened Runtime":"False","Notarize":"False","UserEntitlements":""}
				End
				Begin IDEScriptBuildStep Xojo2DMG , AppliesTo = 0, Architecture = 0, Target = 0
					'**************************************************
					' Create .dmg | Notarization
					'**************************************************
					' https://github.com/jo-tools/xojo2dmg
					'**************************************************
					' This Post Build Script only runs on a local
					' setup of Xojo2DMG.
					' Have a look at the GitHub Repository to read
					' more about Xojo2DMG.
					'**************************************************
					
					If (Not TargetMacOS) Then Return 'Xojo IDE must be running on macOS
					
					'Check Xojo's Build Target
					Select Case CurrentBuildTarget
					Case 16 'macOS: Intel 64Bit
					Case 24 'macOS: ARM 64Bit
					Case 9 'macOS: Universal (Intel 64Bit, ARM 64Bit)
					Else
					Return
					End Select
					
					' Check if a custom local Build Script is available
					Var sCOMPANYNAME As String = PropertyValue("App.CompanyName")
					If (sCOMPANYNAME = "") Then Return
					
					Var sXOJO2DMG As String = DoShellCommand("[ -f ~/.xojo2dmg/" + sCOMPANYNAME + ".sh ] && echo ~/.xojo2dmg/" + sCOMPANYNAME + ".sh").Trim
					If (sXOJO2DMG = "") Then Return 'local company setup of Xojo2DMG not found
					
					'**************************************************
					' Setup Xojo2DMG
					'**************************************************
					Var sPROJECT_PATH As String = DoShellCommand("echo $PROJECT_PATH", 0).Trim
					If sPROJECT_PATH.Right(1) = "/" Then
					'No trailing /
					sPROJECT_PATH = sPROJECT_PATH.Left(sPROJECT_PATH.Length - 1)
					End If
					If (sPROJECT_PATH = "") Then Return
					
					Var sBUILD_LOCATION As String = CurrentBuildLocation.ReplaceAll("\", "") 'don't escape Path
					If sBUILD_LOCATION.Right(1) = "/" Then
					'No trailing /
					sBUILD_LOCATION = sBUILD_LOCATION.Left(sBUILD_LOCATION.Length - 1)
					End If
					
					'Sanity Check: Unsupported XojoVersion when building Universal (Intel 64Bit, ARM 64Bit)
					If ((CurrentBuildTarget = 24) And (sBUILD_LOCATION.Right(18) = "/_macOS ARM 64 bit")) _
					Or _
					((CurrentBuildTarget = 16) And (sBUILD_LOCATION.Right(14) = "/_macOS 64 bit")) Then
					Return
					End If
					
					Var sBUILD_APPNAME As String = CurrentBuildAppName 'Xojo 2022r1 adds .app
					If (sBUILD_APPNAME.Right(4) = ".app") Then sBUILD_APPNAME = sBUILD_APPNAME.Left(sBUILD_APPNAME.Length-4)
					
					Var sBUILD_APP_VERSION As String = PropertyValue("App.Version")
					If (sBUILD_APP_VERSION = "") Then
					sBUILD_APP_VERSION = PropertyValue("App.MajorVersion") + "." + PropertyValue("App.MinorVersion") + "." + PropertyValue("App.BugVersion")
					End If
					
					Var BUILD_APP_STAGECODE As String = ""
					Select Case PropertyValue("App.StageCode")
					Case "0"
					BUILD_APP_STAGECODE = "Dev"
					Case "1"
					BUILD_APP_STAGECODE = "Alpha"
					Case "2"
					BUILD_APP_STAGECODE = "Beta"
					Case "3"
					BUILD_APP_STAGECODE = "Final"
					End Select
					
					Var sBUILD_TYPE As String = "release"
					If DebugBuild Then sBUILD_TYPE = "debug"
					
					Var sBUILD_TARGET As String = "macOS"
					Select Case CurrentBuildTarget
					Case 16 'macOS: Intel 64Bit
					sBUILD_TARGET = "macOS_Intel_64Bit"
					Case 24 'macOS: ARM 64Bit
					sBUILD_TARGET = "macOS_ARM_64Bit"
					Case 9 'macOS: Universal (Intel 64Bit, ARM 64Bit)
					sBUILD_TARGET = "macOS_Universal"
					End Select
					
					
					'**************************************************
					' Launch Xojo2DMG
					'**************************************************
					Var sShellArguments() As String
					sShellArguments.Add(sPROJECT_PATH)
					sShellArguments.Add(sBUILD_LOCATION)
					sShellArguments.Add(sBUILD_APPNAME)
					sShellArguments.Add(sBUILD_APP_VERSION)
					sShellArguments.Add(BUILD_APP_STAGECODE)
					sShellArguments.Add(sBUILD_TYPE)
					sShellArguments.Add(sBUILD_TARGET)
					
					If (Not DebugBuild) Then
					'Launch Xojo2DMG in Terminal
					Call DoShellCommand("osascript -e 'tell application ""Terminal"" to activate'", 0)
					Call DoShellCommand("osascript -e 'tell application ""Terminal"" to do script ""\""" + sXOJO2DMG + "\"" \""" + String.FromArray(sShellArguments, "\"" \""") + "\""""'", 0)
					Return 'see progress and errors in Terminal.app
					End If
					
					Var iShellResult As Integer
					Var sShellResult As String = DoShellCommand("""" + sXOJO2DMG +  """ """ + String.FromArray(sShellArguments, """ """) + """", 0, iShellResult)
					
					'Process and Parse the Output of the ShellScript
					Var sXojo2DMG_Errors() As String
					Var sShellResultLines() As String = sShellResult.ReplaceAll(EndOfLine, "*****").Split("*****")
					For i As Integer = 0 To sShellResultLines.LastIndex
					'get all lines with Xojo2DMG Errors (and not the full output)
					If (sShellResultLines(i).Left(15) = "Xojo2DMG ERROR:") Then
					sXojo2DMG_Errors.Add(sShellResultLines(i))
					End If
					Next
					
					
					Select Case iShellResult
					Case 0
					'Yeah... it's all OK!
					Case 2
					'DebugRun without Codesigning: xojo2dmg.sh will return with 'exit 2'
					'Don't show errors - it's all OK
					Return
					Else
					'Hmm... something went wrong...
					sXojo2DMG_Errors.Add("Xojo2DMG quit with ShellResult: " + iShellResult.ToString)
					End Select
					
					'If there are errors:
					If (sXojo2DMG_Errors.LastIndex >= 0) Then
					'Print just the Errors, and have the full output in Clipboard
					Print String.FromArray(sXojo2DMG_Errors, EndOfLine) + EndOfLine + _
					"Note: Shell Output is in Clipboard"
					Clipboard = sShellResult
					End If
					
					Return
					
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
				Begin IDEScriptBuildStep AzureTrustedSigning , AppliesTo = 2, Architecture = 0, Target = 0
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
					Clipboard = sSIGN_OUTPUT
					Print "AzureTrustedSigning: ats-codesign.sh Error" + EndOfLine + _
					"[ExitCode: " + iSIGN_RESULT.ToString + "]" + EndOfLine + EndOfLine + _
					"Note: Shell Output is available in Clipboard."
					
					If (iSIGN_RESULT <> 125) Then
					Var iCHECK_DOCKERIMAGE_RESULT As Integer
					Var sCHECK_DOCKERIMAGE_OUTPUT As String = DoShellCommand(sDOCKER_EXE + " image inspect " + sDOCKER_IMAGE, 0, iCHECK_DOCKERIMAGE_RESULT)
					If (iCHECK_DOCKERIMAGE_RESULT <> 0) Then
					Print "AzureTrustedSigning: Docker Image '" + sDOCKER_IMAGE + "' not available"
					End If
					End If
					End If
					
				End
				Begin IDEScriptBuildStep CreateZIP , AppliesTo = 2, Architecture = 0, Target = 0
					'**************************************************
					' Create .zip for Windows Builds
					'**************************************************
					' https://github.com/jo-tools
					'**************************************************
					' 1. Read the comments in this PostBuild Script
					' 2. Edit the values according to your needs
					'**************************************************
					' 3. If it's working for you:
					'    Do you like it? Does it help you? Has it saved you time and money?
					'    You're welcome - it's free...
					'    If you want to say thanks I appreciate a message or a small donation.
					'    Contact: xojo@jo-tools.ch
					'    PayPal:  https://paypal.me/jotools
					'**************************************************
					
					If DebugBuild Then Return 'don't create .zip for DebugRuns
					
					' bSILENT=True : don't show any error messages
					Var bSILENT As Boolean = False
					
					'Check Build Target
					Select Case CurrentBuildTarget
					Case 3 'Windows (Intel, 32Bit)
					Case 19 'Windows (Intel, 64Bit)
					Case 25 'Windows(ARM, 64Bit)
					Else
					If (Not bSILENT) Then Print "CreateZIP: Unsupported Build Target"
					Return
					End Select
					
					'Xojo Project Settings
					Var sPROJECT_PATH As String
					Var sBUILD_LOCATION As String = CurrentBuildLocation
					Var sAPP_NAME As String = CurrentBuildAppName
					If (sAPP_NAME.Right(4) = ".exe") Then
					sAPP_NAME = sAPP_NAME.Left(sAPP_NAME.Length - 4)
					End If
					Var sCHAR_FOLDER_SEPARATOR As String
					If TargetWindows Then 'Xojo IDE is running on Windows
					sPROJECT_PATH = DoShellCommand("echo %PROJECT_PATH%", 0).Trim
					sCHAR_FOLDER_SEPARATOR = "\"
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					sPROJECT_PATH = DoShellCommand("echo $PROJECT_PATH", 0).Trim
					If sPROJECT_PATH.Right(1) = "/" Then
					'no trailing /
					sPROJECT_PATH = sPROJECT_PATH.Left(sPROJECT_PATH.Length - 1)
					End If
					If sBUILD_LOCATION.Right(1) = "/" Then
					'no trailing /
					sBUILD_LOCATION = sBUILD_LOCATION.Left(sBUILD_LOCATION.Length - 1)
					End If
					sBUILD_LOCATION = sBUILD_LOCATION.ReplaceAll("\", "") 'don't escape Path
					sCHAR_FOLDER_SEPARATOR = "/"
					End If
					
					If (sPROJECT_PATH = "") Then
					If (Not bSILENT) Then Print "CreateZIP: Could not get the Environment Variable PROJECT_PATH from the Xojo IDE." + EndOfLine + EndOfLine + "Unfortunately, it's empty.... try again after re-launching the Xojo IDE and/or rebooting your machine."
					Return
					End If
					
					'Check Stage Code for ZIP Filename
					Var sSTAGECODE_SUFFIX As String
					Select Case PropertyValue("App.StageCode")
					Case "0" 'Development
					sSTAGECODE_SUFFIX = "-dev"
					Case "1" 'Alpha
					sSTAGECODE_SUFFIX = "-alpha"
					Case "2" 'Beta
					sSTAGECODE_SUFFIX = "-beta"
					Case "3" 'Final
					'not used in filename
					End Select
					
					'Build ZIP Filename
					Var sZIP_FILENAME As String
					Select Case CurrentBuildTarget
					Case 3 'Windows (Intel, 32Bit)
					sZIP_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Windows_Intel_32Bit.zip"
					Case 19 'Windows (Intel, 64Bit)
					sZIP_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Windows_Intel_64Bit.zip"
					Case 25 'Windows(ARM, 64Bit)
					sZIP_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Windows_ARM_64Bit.zip"
					Else
					Return
					End Select
					
					'Create .zip
					Var sPATH_PARTS() As String = sBUILD_LOCATION.Split(sCHAR_FOLDER_SEPARATOR)
					Var sAPP_FOLDERNAME As String = sPATH_PARTS(sPATH_PARTS.LastIndex)
					sPATH_PARTS.RemoveAt(sPATH_PARTS.LastIndex)
					Var sFOLDER_BASE As String = String.FromArray(sPATH_PARTS, sCHAR_FOLDER_SEPARATOR)
					
					If TargetWindows Then 'Xojo IDE is running on Windows
					Var sPOWERSHELL_COMMAND As String = "cd """ + sFOLDER_BASE + """; Compress-Archive -Path .\* -DestinationPath ""..\" + sZIP_FILENAME + """ -Force"
					Var iPOWERSHELL_RESULT As Integer
					Var sPOWERSHELL_OUTPUT As String = DoShellCommand("powershell -command """ + sPOWERSHELL_COMMAND.ReplaceAll("""", "'") + """", 0, iPOWERSHELL_RESULT)
					If (iPOWERSHELL_RESULT <> 0) Then
					If (Not bSILENT) Then Print "CreateZIP Error" + EndOfLine + EndOfLine + _
					sPOWERSHELL_OUTPUT.Trim + EndOfLine + _
					"[ExitCode: " + iPOWERSHELL_RESULT.ToString + "]"
					End If
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					Var iZIP_RESULT As Integer
					Var sZIP_OUTPUT As String = DoShellCommand("cd """ + sFOLDER_BASE + """ && zip -r ""../" + sZIP_FILENAME + """ ""./" + sAPP_FOLDERNAME + """", 0, iZIP_RESULT)
					If (iZIP_RESULT <> 0) Then
					If (Not bSILENT) Then Print "CreateZIP Error" + EndOfLine + EndOfLine + _
					sZIP_OUTPUT.Trim + EndOfLine + _
					"[ExitCode: " + iZIP_RESULT.ToString + "]"
					End If
					End If
					
				End
			End
#tag EndBuildAutomation
