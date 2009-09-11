//
//  Pill.m
//  PigGame
//
//  Created by Fabio Balancin on 9/11/09.
//  Copyright 2009 Umpulo. All rights reserved.
//

#import "Pill.h"


@implementation Pill

@synthesize pigsDict;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	NSLog(@"Clicaaa!");
	usingPill = YES;
	
	pillActiveView = [[UIImageView alloc] initWithImage:self.image];
	pillActiveView.frame = self.frame;
	
	[self.superview addSubview:pillActiveView];

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch* allTouches = [touches anyObject];
	CGPoint location = [allTouches locationInView:self.superview];
	
	pillActiveView.center = CGPointMake(location.x, location.y); 
	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

	UITouch* allTouches = [touches anyObject];
	CGPoint location = [allTouches locationInView:self.superview];
	if(location.x >= [[pigsDict objectForKey:@"0"] frame].origin.x && location.x <= [[pigsDict objectForKey:@"2"] frame].origin.x+[[pigsDict objectForKey:@"2"] frame].size.width){
		
		float xPos = ceil((location.x-[[pigsDict objectForKey:@"0"] frame].origin.x)/[[pigsDict objectForKey:@"2"] frame].size.width)-1;
		float yPos = ceil((location.y-[[pigsDict objectForKey:@"0"] frame].origin.y)/[[pigsDict objectForKey:@"6"] frame].size.height)-1;
		int pigId = xPos+(yPos*3);
		if(![[pigsDict objectForKey:[NSString stringWithFormat:@"%i", pigId]] dead])
			[[pigsDict objectForKey:[NSString stringWithFormat:@"%i", pigId]] setLife:30];
		NSLog(@"Soltaaaaa!!! %i", pigId);
		
	}
	
	[pillActiveView removeFromSuperview];
	
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [super dealloc];
}


@end
