//
//  PigGameAppDelegate.m
//  PigGame
//
//  Created by Fabio Balancin on 9/9/09.
//  Copyright Umpulo 2009. All rights reserved.
//

#import "PigGameAppDelegate.h"
#import "PigGameViewController.h"

@implementation PigGameAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
