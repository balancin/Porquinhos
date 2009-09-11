//
//  Grid.h
//  PigGame
//
//  Created by Fabio Balancin on 9/9/09.
//  Copyright 2009 Umpulo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pig.h"

@interface Grid : NSObject {

	NSMutableDictionary* pigsDict;
	int mainTime;
	UIView* view;
	
}

-(void) mainLoop;
-(void) initWithView:(UIView*)viewScene;

@end
