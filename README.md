<p align="center">
<img width="750" alt="promo-main" src="https://github.com/artdima/Logix/blob/main/Logix.png?raw=true">
</p>

<p align="center">
<img alt="Version" src="https://img.shields.io/badge/version-0.0.1-green.svg?style=flat-square" />
<a href="https://cocoapods.org/pods/netfox"><img alt="Cocoapods Compatible" src="https://img.shields.io/cocoapods/v/netfox.svg?style=flat-square" /></a>
<a href="https://github.com/Carthage/Carthage"><img alt="Carthage Compatible" src="https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat-square" /></a>
<img alt="Platform" src="https://img.shields.io/cocoapods/p/netfox.svg?style=flat-square" />
<a href="https://opensource.org/licenses/MIT"><img alt="License" src="https://img.shields.io/badge/license-MIT-orange.svg?style=flat-square" /></a>
</p>

Start debugging iOS network calls like a wizard, without extra code! Logix makes debugging quick and reliable.

## Start

#### Swift
```swift
// AppDelegate
import Logix
Logix.launching() // in didFinishLaunchingWithOptions:
```
Just simple as that!

Note: Please wrap the above line with
```c
#if DEBUG
. . .
#endif
```
to prevent library’s execution on your production app.

You can add the DEBUG symbol with the -DDEBUG entry. Set it in the "Swift Compiler - Custom Flags" section -> "Other Swift Flags" line in project’s "Build Settings"



## License

Pulse is available under the MIT license. See the LICENSE file for more info.
