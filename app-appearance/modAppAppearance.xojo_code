#tag Module
Protected Module modAppAppearance
	#tag CompatibilityFlags = API2Only and ( ( TargetDesktop and ( Target32Bit or Target64Bit ) ) )
	#tag Method, Flags = &h0, CompatibilityFlags = API2Only and ( (TargetDesktop and (Target32Bit or Target64Bit)) )
		Function IsDarkModeSupported() As Boolean
		  'Global
		  If (Not AppSupportsDarkMode) Or (Not TargetDesktop) Then Return False
		  
		  'App is built with DarkMode Support
		  #If TargetWindows Then
		    'requires Xojo 2021r3
		    if (XojoVersion < 2021.03) then return false
		    
		    'DarkMode is supported on Windows 10 Build 18362 (or newer)
		    Try
		      'GetVersionEx function
		      'http://msdn.microsoft.com/en-us/library/windows/desktop/ms724451(v=vs.85).aspx
		      
		      'OSVERSIONINFOEX structure
		      'http://msdn.microsoft.com/en-us/library/windows/desktop/ms724833(v=vs.85).aspx
		      
		      'GetSystemMetrics function
		      'http://msdn.microsoft.com/en-us/library/windows/desktop/ms724385(v=vs.85).aspx
		      
		      'RtlGetVersion
		      'https://msdn.microsoft.com/en-us/library/windows/hardware/ff561910(v=vs.85).aspx
		      
		      Declare Sub GetVersionExW Lib "Kernel32" ( info As Ptr )
		      Declare Function GetSystemMetrics Lib "User32" ( metrixIndex As Int32 ) As Int32
		      Soft Declare Function RtlGetVersion Lib "ntdll.dll" (info As Ptr ) As Int32
		      
		      Var info As MemoryBlock
		      Var iMajorVersion, iMinorVersion, iBuildNumber, iPlatformID As Integer
		      Var sServicePack As String
		      Var iServicePackMajor, iServicePackMinor As Integer
		      Var iSuiteMask As Integer
		      Var iProductType As Integer
		      
		      Var iSPOffset As Integer
		      If System.IsFunctionAvailable( "GetVersionExW", "Kernel32" ) Then
		        iSPOffset = 20 + (2 * 128)
		        info =  New MemoryBlock( iSPOffset + 6 + 2)
		        info.Long( 0 ) = info.Size
		        
		        GetVersionExW( info )
		        
		        iMajorVersion = info.Long( 4 )
		        iMinorVersion = info.Long( 8 )
		        iBuildNumber = info.Long( 12 )
		        iPlatformID = info.Long( 16 )
		        sServicePack = info.WString( 20 )
		        iServicePackMajor = info.Int16Value( iSPOffset )
		        iServicePackMinor = info.Int16Value( iSPOffset + 2)
		        iSuiteMask = info.Int16Value( iSPOffset + 4)
		        iProductType = info.Byte( iSPOffset + 6)
		      End If
		      
		      If (iMajorVersion = 6) And (iMinorVersion = 2) Then
		        'Windows 8 (now newer) - Without a Manifest GetVersionEx always return "Windows 8"
		        'https://msdn.microsoft.com/en-us/library/dn481241(v=vs.85).aspx
		        Try
		          If System.IsFunctionAvailable( "RtlGetVersion", "ntdll.dll" ) Then
		            iSPOffset = 20 + (2 * 128)
		            info =  New MemoryBlock( iSPOffset + 6 + 2)
		            info.Long( 0 ) = info.Size
		            
		            If (RtlGetVersion( info ) = 0) Then
		              'STATUS_SUCCESS = 0 -> diese zweite Abfrage hat funktioniert
		              iMajorVersion = info.Long( 4 )
		              iMinorVersion = info.Long( 8 )
		              iBuildNumber = info.Long( 12 )
		              iPlatformID = info.Long( 16 )
		              sServicePack = info.WString( 20 )
		              iServicePackMajor = info.Int16Value( iSPOffset )
		              iServicePackMinor = info.Int16Value( iSPOffset + 2)
		              iSuiteMask = info.Int16Value( iSPOffset + 4)
		              iProductType = info.Byte( iSPOffset + 6)
		            End If
		            
		          End If
		        Catch err As RuntimeException
		          'ignore
		        End Try
		      End If
		      
		      'DarkMode is supported on Windows 10 Build 18362 (or newer)
		      Return (iMajorVersion >= 10) And (iBuildNumber >= 18362)
		      
		    Catch err As RuntimeException
		      Return False
		    End Try
		    
		    Return False
		  #EndIf
		  
		  #If TargetLinux And (XojoVersion < 2022.04) Then
		    'Xojo supports DarkMode on Linux as of 2022r4
		    Return False
		  #EndIf
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = API2Only and ( (TargetDesktop and (Target32Bit or Target64Bit)) )
		Function macOSAppAppearance() As NSAppearanceType
		  #If TargetMacOS Then
		    If (Not IsDarkModeSupported) Then Return NSAppearanceType.Default
		    
		    Declare Function NSClassFromString Lib "Cocoa" (sClassName As CFStringRef) As Ptr
		    Declare Function NSSelectorFromString Lib "Cocoa" (sSelector As CFStringRef) As Ptr
		    Declare Function respondsToSelector Lib "Cocoa" selector "respondsToSelector:" (ptrObj As Ptr, ptrSelector As Ptr) As Boolean
		    Declare Function sharedApplication Lib "AppKit" Selector "sharedApplication" (ptrClassRef As Ptr) As Ptr
		    
		    Var ptrSharedApp As Ptr = sharedApplication(NSClassFromString("NSApplication"))
		    If (ptrSharedApp <> Nil) And respondsToSelector(ptrSharedApp, NSSelectorFromString("setAppearance:")) Then
		      // https://developer.apple.com/documentation/appkit/nsapplication/2967170-appearance?language=objc
		      // https://developer.apple.com/documentation/appkit/nsappearancename?language=objc
		      Soft Declare Function getAppearance Lib "AppKit" Selector "appearance" (ptrNSApplicationInstance As Ptr) As Ptr
		      Soft Declare Function NSAppearanceNamed Lib "AppKit" Selector "appearanceNamed:" (ptrNSAppearanceClass As Ptr, sAppearanceName As CFStringRef) As Ptr
		      
		      Var ptrAppearance As Ptr = getAppearance(ptrSharedApp)
		      
		      if (ptrAppearance = NSAppearanceNamed(NSClassFromString("NSAppearance"), "NSAppearanceNameAqua")) then return NSAppearanceType.Light
		      if (ptrAppearance = NSAppearanceNamed(NSClassFromString("NSAppearance"), "NSAppearanceNameDarkAqua")) then return NSAppearanceType.Dark
		      return NSAppearanceType.Default
		    End If
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = API2Only and ( (TargetDesktop and (Target32Bit or Target64Bit)) )
		Sub macOSAppAppearance(Assigns appearance As NSAppearanceType)
		  #If TargetMacOS Then
		    If (Not IsDarkModeSupported) Then Return
		    
		    Declare Function NSClassFromString Lib "Cocoa" (sClassName As CFStringRef) As Ptr
		    Declare Function NSSelectorFromString Lib "Cocoa" (sSelector As CFStringRef) As Ptr
		    Declare Function respondsToSelector Lib "Cocoa" selector "respondsToSelector:" (ptrObj As Ptr, ptrSelector As Ptr) As Boolean
		    Declare Function sharedApplication Lib "AppKit" Selector "sharedApplication" (ptrClassRef As Ptr) As Ptr
		    
		    Var ptrSharedApp As Ptr = sharedApplication(NSClassFromString("NSApplication"))
		    If (ptrSharedApp <> Nil) And respondsToSelector(ptrSharedApp, NSSelectorFromString("setAppearance:")) Then
		      // https://developer.apple.com/documentation/appkit/nsapplication/2967170-appearance?language=objc
		      // https://developer.apple.com/documentation/appkit/nsappearancename?language=objc
		      Soft Declare Sub setAppearance Lib "AppKit" Selector "setAppearance:" (ptrNSApplicationInstance As Ptr, ptrNSAppearanceInstance As Ptr)
		      Soft Declare Function NSAppearanceNamed Lib "AppKit" Selector "appearanceNamed:" (ptrNSAppearanceClass As Ptr, sAppearanceName As CFStringRef) As Ptr
		      
		      Select Case appearance
		      Case NSAppearanceType.Light
		        setAppearance(ptrSharedApp, NSAppearanceNamed(NSClassFromString("NSAppearance"), "NSAppearanceNameAqua"))
		      Case NSAppearanceType.Dark
		        setAppearance(ptrSharedApp, NSAppearanceNamed(NSClassFromString("NSAppearance"), "NSAppearanceNameDarkAqua"))
		      Else
		        setAppearance(sharedApplication(NSClassFromString("NSApplication")), nil)
		      End Select
		    End If
		  #Else
		    #Pragma Unused appearance
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = API2Only and ( (TargetDesktop and (Target32Bit or Target64Bit)) )
		Function macOSAppAppearanceAvailable() As Boolean
		  #If TargetMacOS Then
		    If (Not IsDarkModeSupported) Then Return False
		    
		    Declare Function NSClassFromString Lib "Cocoa" (sClassName As CFStringRef) As Ptr
		    Declare Function NSSelectorFromString Lib "Cocoa" (sSelector As CFStringRef) As Ptr
		    Declare Function respondsToSelector Lib "Cocoa" selector "respondsToSelector:" (ptrObj As Ptr, ptrSelector As Ptr) As Boolean
		    Declare Function sharedApplication Lib "AppKit" Selector "sharedApplication" (ptrClassRef As Ptr) As Ptr
		    
		    Var ptrSharedApp As Ptr = sharedApplication(NSClassFromString("NSApplication"))
		    If (ptrSharedApp <> Nil) And respondsToSelector(ptrSharedApp, NSSelectorFromString("setAppearance:")) Then
		      // https://developer.apple.com/documentation/appkit/nsapplication/2967170-appearance?language=objc
		      Return True
		    End If
		  #EndIf
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = API2Only and ( (TargetDesktop and (Target32Bit or Target64Bit)) )
		Sub Windows_DarkMode_OptIn(Assigns pbOptIn As Boolean)
		  #If TargetWindows Then
		    // https://blog.xojo.com/2021/11/18/welcome-to-the-dark-side-of-windows/
		    Var bDarkModeDisabled As Boolean = (Not pbOptIn)
		    System.EnvironmentVariable("XOJO_WIN32_DARKMODE_DISABLED") = bDarkModeDisabled.ToString
		  #Else
		    #Pragma unused pbOptIn
		  #EndIf
		  
		End Sub
	#tag EndMethod


	#tag Enum, Name = NSAppearanceType, Flags = &h0, CompatibilityFlags = API2Only and ( (TargetDesktop and (Target32Bit or Target64Bit)) )
		Default=0
		  Light=1
		Dark=2
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
