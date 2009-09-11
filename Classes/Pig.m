//
//  Pig.m
//  PigGame
//
//  Created by Fabio Balancin on 9/9/09.
//  Copyright 2009 Umpulo. All rights reserved.
//

#import "Pig.h"


@implementation Pig

@synthesize pigId, pigsDict, dead;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

	NSLog(@"AH!");
	//[pigsDict setObject:[[NSNumber alloc] initWithInt:30] forKey:[NSString stringWithFormat:@"%i", pigId]];
	life = 30;
	
}

-(int)life {

	return life;
	
}

-(void)setLife:(int)s {

	life = s;
	//NSLog(@"%i %f", life, life/(30*100));
	int n1 = life*100;
	int nIm = 11-(10*(n1/30)/100);
	
	if(nIm < 11)
		self.image = [UIImage imageNamed:[NSString stringWithFormat:@"pig_s%i.png", nIm]];
	

}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [super dealloc];
}


@end
