# App Appearance
Xojo example project

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## Description
An example Xojo project to show how to deal with Xojo's DarkMode Support to customize the application's appearance on macOS and Windows.

### macOS
macOS 10.14 has introduced DarkMode. Xojo just provides a Build Setting ```Supports DarkMode```. The built application will then appear in Dark- or Lightmode, according to the current system setting.  
This example project shows how to override this, so that your application can provide a user preference allowing the application to appear in ```Always Dark```, ```Always Light``` - or of course the ```System Default```.

### Windows
DarkMode on Windows is... not that good - at least not for Win32 Apps/Controls, which is what Xojo is currently using. For that reason it is best practice to explizitly allow the user to ```Opt-in``` for DarkMode support of your application. Many Windows users love to have their system setting to have dark appearance in apps, but might dislike that in Win32-apps.  
Starting with Xojo 2021r3, Xojo supports DarkMode for ```TargetWindows```. This example project shows how to allow the users to ```Opt-in``` for DarkMode support, because Xojo by default always uses the system settings.  
*Note: Unlike macOS, you can never have the application show in DarkMode on Windows if 'app appearance setting' is 'Light Mode'.*

### ScreenShots
macOS in DarkMode, but application in ```Always Light```  
![ScreenShot: macOS - Always Light](screenshots/app-appearance_always-light.png?raw=true)

macOS in LightMode, but application in ```Always Dark```  
![ScreenShot: macOS - Always Dark](screenshots/app-appearance_always-dark.png?raw=true)

Windows in DarkMode and user's app-preference: ```DarkMode Opt-in: no```, so application will appear in ```Light```   
![ScreenShot: macOS - Always Light](screenshots/app-appearance_optin-no.png?raw=true)

Windows in DarkMode and user's app-preference: ```DarkMode Opt-in: yes```, so application will appear in ```Dark```   
![ScreenShot: macOS - Always Light](screenshots/app-appearance_optin-yes.png?raw=true)


## Xojo
### Requirements
[Xojo](https://www.xojo.com/) is a rapid application development for Desktop, Web, Mobile & Raspberry Pi.  

The Desktop application Xojo example project ```AppAppearance.xojo_project``` is using:
- Xojo 2024r1.1
- API 2

*Note: You'll need to build with Xojo 2021r3 or later to get DarkMode Support on TargetWindows*

### How to use in your own Xojo project?
1. Copy the Module ```modAppAppearance``` from the example project, and paste it into your project.
2. Study the example project to learn how to use the provided methods in the Module.
   - Windows: The Opt-In happens in ```App.Open```: ```Windows_DarkMode_OptIn = true|false```
   - macOS: You can switch the appearance any time. See actions in the corresponding ```PushButtons```, e.g.: ```macOSAppAppearance = NSAppearanceType.Light|Dark|Default```

## About
Juerg Otter is a long term user of Xojo and working for [CM Informatik AG](https://cmiag.ch/). Their Application [CMI LehrerOffice](https://cmi-bildung.ch/) is a Xojo Design Award Winner 2018. In his leisure time Juerg provides some [bits and pieces for Xojo Developers](https://www.jo-tools.ch/).

### Contact
[![E-Mail](https://img.shields.io/static/v1?style=social&label=E-Mail&message=xojo@jo-tools.ch)](mailto:xojo@jo-tools.ch)
&emsp;&emsp;
[![Follow on Facebook](https://img.shields.io/static/v1?style=social&logo=facebook&label=Facebook&message=juerg.otter)](https://www.facebook.com/juerg.otter)
&emsp;&emsp;
[![Follow on Twitter](https://img.shields.io/twitter/follow/juergotter?style=social)](https://twitter.com/juergotter)

### Donation
Do you like this project? Does it help you? Has it saved you time and money?  
You're welcome - it's free... If you want to say thanks I'd appreciate a [message](mailto:xojo@jo-tools.ch) or a small [donation via PayPal](https://paypal.me/jotools).  

[![PayPal Dontation to jotools](https://img.shields.io/static/v1?style=social&logo=paypal&label=PayPal&message=jotools)](https://paypal.me/jotools)
