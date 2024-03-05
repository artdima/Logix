//
//  NSURLSessionConfiguration+Logix.m
//  Logix-SDK
//
//  Created by Medyannik Dmitri on 01.10.2022.
//  Copyright © 2022 Logix. All rights reserved.
//

#import "NSURLSessionConfiguration+Logix.h"
#import "LogixMethodSwizzling.h"
#if __has_include(<Logix/Logix-Swift.h>)
#import <Logix/Logix-Swift.h>
#else
//#import "Logix-Swift.h"
#endif

typedef NSURLSessionConfiguration*(*SessionConfigConstructor)(id,SEL);
static SessionConfigConstructor orig_defaultSessionConfiguration;
static SessionConfigConstructor orig_ephemeralSessionConfiguration;

static NSURLSessionConfiguration* Logix_defaultSessionConfiguration(id self, SEL _cmd)
{
    NSURLSessionConfiguration* config = orig_defaultSessionConfiguration(self,_cmd); // call original method
    
    //[Logix enable:YES sessionConfiguration:config];
    return config;
}

static NSURLSessionConfiguration* Logix_ephemeralSessionConfiguration(id self, SEL _cmd)
{
    NSURLSessionConfiguration* config = orig_ephemeralSessionConfiguration(self,_cmd); // call original method
    
    //[Logix enable:YES sessionConfiguration:config];
    return config;
}

__attribute__((constructor)) static void sessionConfigurationInjectEntry(void) {
    
    orig_defaultSessionConfiguration = (SessionConfigConstructor)LogixReplaceMethod(@selector(defaultSessionConfiguration),
                                                                                       (IMP)Logix_defaultSessionConfiguration,
                                                                                       [NSURLSessionConfiguration class],
                                                                                       YES);
    
    orig_ephemeralSessionConfiguration = (SessionConfigConstructor)LogixReplaceMethod(@selector(ephemeralSessionConfiguration),
                                                                                         (IMP)Logix_ephemeralSessionConfiguration,
                                                                                         [NSURLSessionConfiguration class],
                                                                                         YES);
}

