#import <UIKit/UIKit.h>

/// Library constructor to observe `UIApplicationDidFinishLaunchingNotification` immediately on app launch.
/// Calls `applicationDidFinishLaunching` on Logix class to initialize Logix.
/// This is an alternative to a +initialize in Objective-C.
static void __attribute__ ((constructor)) logix_constructor() {
    Class class = NSClassFromString(@"Logix.Logix");
    SEL selector = NSSelectorFromString(@"applicationDidFinishLaunching");

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];

    [center addObserver:class
               selector:selector
                   name:UIApplicationDidFinishLaunchingNotification
                 object:nil];
}
