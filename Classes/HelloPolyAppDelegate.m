//
//  HelloPolyAppDelegate.m
//  HelloPoly
//
//  Created by Hoonio on 3/6/10.
//  Copyright Hoonio.com 2010. All rights reserved.
//

#import "HelloPolyAppDelegate.h"

@implementation HelloPolyAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
