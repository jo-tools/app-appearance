#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Event
		Sub Opening()
		  Me.AllowAutoQuit = True
		  
		  #If TargetWindows Then
		    IsWindowsDarkModeOptIn = False
		    If IsDarkModeSupported Then
		      Var d As New MessageDialog
		      d.IconType = MessageDialog.IconTypes.Question
		      d.ActionButton.Caption = "Yes"
		      d.CancelButton.Visible = False
		      d.AlternateActionButton.Visible = True
		      d.AlternateActionButton.Caption = "No"
		      d.Title = "DarkMode"
		      d.Message = "DarkMode: Do you want to Opt-in?"
		      d.Explanation = "In a real application, you would store that choice as a user preference and read the value in App.Opening."
		      
		      Var b As MessageDialogButton = d.ShowModal
		      Select Case b
		      Case d.ActionButton 'Yes
		        IsWindowsDarkModeOptIn = True
		      Case d.AlternateActionButton 'No
		        IsWindowsDarkModeOptIn = False
		      End Select
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
		Private w As DesktopWindow
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
		#tag ViewProperty
			Name="IsWindowsDarkModeOptIn"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
