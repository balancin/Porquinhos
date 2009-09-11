//
//  PigGameAppDelegate.h
//  PigGame
//
//  Created by Fabio Balancin on 9/9/09.
//  Copyright Umpulo 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PigGameViewController;

@interface PigGameAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PigGameViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PigGameViewController *viewController;

@end

