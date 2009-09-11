//
//  Pill.h
//  PigGame
//
//  Created by Fabio Balancin on 9/11/09.
//  Copyright 2009 Umpulo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Pill : UIImageView {

	BOOL usingPill;
	UIImageView* pillActiveView;
	NSMutableDictionary* pigsDict;
	
}

@property(nonatomic, retain) NSMutableDictionary* pigsDict;

@end
