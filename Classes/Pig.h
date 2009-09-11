//
//  Pig.h
//  PigGame
//
//  Created by Fabio Balancin on 9/9/09.
//  Copyright 2009 Umpulo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Pig : UIImageView {

	int pigId;
	NSMutableDictionary* pigsDict;
	BOOL dead;
	int life;
	
}

-(int)life;
-(void)setLife:(int)s;

@property(nonatomic, readwrite) int pigId;
//@property(nonatomic, readwrite) int life;
@property(nonatomic, retain) NSMutableDictionary* pigsDict;
@property(nonatomic, readwrite) BOOL dead;

@end
