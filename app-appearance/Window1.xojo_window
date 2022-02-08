#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   280
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   775346175
   MenuBarVisible  =   True
   MinHeight       =   280
   MinimizeButton  =   True
   MinWidth        =   600
   Placement       =   0
   Resizeable      =   False
   Title           =   "App Appearance"
   Visible         =   True
   Width           =   600
   Begin Label labAvailabilityTitle
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Availability:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   115
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
   Begin Label labAvailability
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   180
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "(not) available"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   115
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   400
   End
   Begin Canvas cnvAppIcon
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   64
      HelpTag         =   "https://www.jo-tools.ch/xojo/app-appearance/"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   64
   End
   Begin Label labAppName
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   "https://www.jo-tools.ch/xojo/app-appearance/"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   180
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "App Appearance"
      TextAlign       =   0
      TextColor       =   &c0072D800
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   True
      Visible         =   True
      Width           =   200
   End
   Begin Label labAppVersion
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   180
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "AppVersion"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   54
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin Separator Separator1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   3
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   100
      Transparent     =   True
      Visible         =   True
      Width           =   600
   End
   Begin Label labThanks
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   380
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Would you like to say 'Thank you'?"
      TextAlign       =   2
      TextColor       =   &c66666600
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin Canvas cnvPayPal
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   30
      HelpTag         =   "https://paypal.me/jotools"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   474
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   54
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   106
   End
   Begin Label labContact
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   "xojo@jo-tools.ch"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   394
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Contact"
      TextAlign       =   1
      TextColor       =   &c0072CE00
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   54
      Transparent     =   True
      Underline       =   True
      Visible         =   True
      Width           =   70
   End
   Begin Label labAppearanceCurrentTitle
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Current Appearance:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   145
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
   Begin Label labAppearanceCurrent
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   180
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "(default)"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   145
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   400
   End
   Begin Timer timAppearanceRefresh
      Index           =   -2147483648
      LockedInPosition=   True
      Mode            =   0
      Period          =   10
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin PushButton btnAppearanceLight
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Always Light"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   180
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   175
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   240
   End
   Begin PushButton btnAppearanceDark
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Always Dark"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   180
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   207
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   240
   End
   Begin PushButton btnAppearanceDefault
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "System Default"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   180
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   239
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   240
   End
   Begin Label labChangeTitle
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Change to:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   175
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Self.Title = "App Appearance -  v" + Str(App.MajorVersion) + "." + Str(App.MinorVersion) + "." + Str(App.BugVersion)
		  
		  #If (Not TargetMacOS) Then
		    labChangeTitle.Visible = False
		    btnAppearanceDark.Visible = False
		    btnAppearanceDefault.Visible = False
		    btnAppearanceLight.Visible = False
		    
		    Self.MinHeight = labChangeTitle.Top + 10
		    Self.Height = Self.MinHeight
		  #EndIf
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma unused areas
		  #Pragma unused g
		  
		  timAppearanceRefresh.Mode = Timer.ModeSingle
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub RefreshAppearanceCurrent()
		  Dim sStatus As String
		  
		  #If TargetWindows Then
		    
		    If IsDarkModeSupported And App.IsWindowsDarkModeOptIn Then
		      sStatus = "System Default (currently: " + If(IsDarkMode, "Dark", "Light") + ")"
		    Else
		      sStatus = "Xojo Default (currently: " + If(IsDarkMode, "Dark", "Light") + ")"
		    End If
		    
		  #ElseIf TargetMacOS Then
		    
		    Dim currentAppearance As MacOS_AppAppearance = macOSAppAppearance
		    Select Case currentAppearance
		    Case MacOS_AppAppearance.Aqua
		      sStatus = "Always Light"
		    Case MacOS_AppAppearance.Dark
		      sStatus = "Always Dark"
		    Else
		      sStatus = "System Default (currently: " + If(IsDarkMode, "Dark", "Light") + ")"
		    End Select
		    
		  #Else
		    
		    sStatus = "Xojo Default (currently: " + If(IsDarkMode, "Dark", "Light") + ")"
		    
		  #EndIf
		  
		  If (labAppearanceCurrent.Text <> sStatus) Then
		    labAppearanceCurrent.Text = sStatus
		  End If
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events labAvailability
	#tag Event
		Sub Open()
		  Dim bAvailable As Boolean = False
		  #If TargetMacOS Then
		    bAvailable = macOSAppAppearanceAvailable
		  #ElseIf TargetWindows Then
		    bAvailable = IsDarkModeSupported
		  #EndIf
		  
		  If bAvailable Then
		    Me.Text = "available"
		    Me.TextColor = &c3F7F02
		  Else
		    Me.Text = "not available"
		    Me.TextColor = &cFB0106
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvAppIcon
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma unused areas
		  
		  g.DrawPicture(AppIcon_64, 0, 0)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If (x >= 0) And (x < Me.Width) And (y > 0) And (y < Me.Height) Then
		    ShowURL("https://www.jo-tools.ch/xojo/app-appearance/")
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #Pragma unused X
		  #Pragma unused Y
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labAppName
	#tag Event
		Sub Open()
		  Me.Text = "App Appearance"
		  Me.TextSize = 18
		  Me.Bold = True
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If (x >= 0) And (x < Me.Width) And (y > 0) And (y < Me.Height) Then
		    ShowURL("https://www.jo-tools.ch/xojo/app-appearance/")
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #Pragma unused X
		  #Pragma unused Y
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labAppVersion
	#tag Event
		Sub Open()
		  If (App.ShortVersion <> "") Then
		    Me.Text = App.ShortVersion
		    Return
		  End If
		  
		  Me.Text = Str(App.MajorVersion) + "." + Str(App.MinorVersion) + "." + Str(App.BugVersion)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvPayPal
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma unused areas
		  
		  g.ForeColor = &cFFFFFF
		  #If (XojoVersion >= 2018.03) Then
		    If IsDarkMode Then g.ForeColor = &cD0D0D0
		  #EndIf
		  g.FillRect(0, 0, g.Width, g.Height)
		  g.ForeColor = &c909090
		  g.DrawRect(0, 0, g.Width, g.Height)
		  g.DrawPicture(PayPal, 3, 2, 100, 26, 0, 0, PayPal.Width, PayPal.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If (x >= 0) And (x < Me.Width) And (y > 0) And (y < Me.Height) Then
		    ShowURL("https://paypal.me/jotools")
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #Pragma unused X
		  #Pragma unused Y
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events labContact
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #Pragma unused X
		  #Pragma unused Y
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If (x >= 0) And (x < Me.Width) And (y > 0) And (y < Me.Height) Then
		    ShowURL("mailto:xojo@jo-tools.ch")
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events timAppearanceRefresh
	#tag Event
		Sub Action()
		  Self.RefreshAppearanceCurrent
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAppearanceLight
	#tag Event
		Sub Action()
		  macOSAppAppearance = MacOS_AppAppearance.Aqua
		  timAppearanceRefresh.Mode = Timer.ModeSingle
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAppearanceDark
	#tag Event
		Sub Action()
		  macOSAppAppearance = MacOS_AppAppearance.Dark
		  timAppearanceRefresh.Mode = Timer.ModeSingle
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAppearanceDefault
	#tag Event
		Sub Action()
		  macOSAppAppearance = MacOS_AppAppearance.Default
		  timAppearanceRefresh.Mode = Timer.ModeSingle
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
#tag EndViewBehavior
