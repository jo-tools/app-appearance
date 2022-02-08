#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Me.AutoQuit = True
		  
		  #If TargetWindows Then
		    IsWindowsDarkModeOptIn = False
		    If IsDarkModeSupported Then
		      Dim n As Integer = MsgBox( _
		      "DarkMode: Do you want to Opt-in?" + EndOfLine + EndOfLine + _
		      "In a real application, you would store that choice as a user preference and read the value in App.Open.", _
		      36)
		      If n = 6 Then
		        // user pressed Yes
		        IsWindowsDarkModeOptIn = True
		      Elseif n = 7 Then
		        // user pressed No
		        IsWindowsDarkModeOptIn = False
		      End If
		    End If
		    Windows_DarkMode_OptIn = IsWindowsDarkModeOptIn
		  #EndIf
		  
		  w = New Window1
		  w.Show
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		IsWindowsDarkModeOptIn As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private w As Window
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
