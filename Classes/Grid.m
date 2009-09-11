//
//  Grid.m
//  PigGame
//
//  Created by Fabio Balancin on 9/9/09.
//  Copyright 2009 Umpulo. All rights reserved.
//

#import "Grid.h"


@implementation Grid

-(void) initWithView:(UIView*)viewScene {

	view = viewScene;
	NSTimer* mainLoop = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(mainLoop) userInfo:nil repeats:YES];
	pigsDict = [[NSMutableDictionary alloc] init];
	
	//Cria porquinho na tela
	UIImage* image = [UIImage imageNamed:@"pig_s1.png"];
	//NSMutableArray* pigs = [[NSMutableArray alloc] init];
	for(int i = 0; i < 9; i++){
	
		//NSLog(@"%f %f %i", (i%3)*image.size.width, ((i-(i%3))/3)*image.size.height, ((i-(i%3))/3)*20);
		//[pigs addObject:[[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:(i%3)*image.size.width], [NSNumber numberWithFloat:((i-(i%3))/3)*image.size.height], nil]];

		Pig* imageView = [[Pig alloc] initWithImage:image];
		imageView.pigId = i;
		imageView.tag = i;
		imageView.frame = CGRectMake((i%3)*image.size.width+35, ((i-(i%3))/3)*image.size.height+100, image.size.width, image.size.height); //(i%3)*image.size.height
		imageView.userInteractionEnabled = YES;
		imageView.pigsDict = pigsDict;
		imageView.dead = NO;
		imageView.life = 30;
		[pigsDict setObject:imageView forKey:[NSString stringWithFormat:@"%i", i]];
		
		[view addSubview:imageView];
		
	}
	
//	UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
//	imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
//	
//	[view addSubview:imageView];
	
	
}

-(void) mainLoop {

	mainTime = mainTime+1;
	NSLog(@"mainTime %i", mainTime);
	
	for(int i = 0; i < 9; i++){ 
		
		if(![[pigsDict objectForKey:[NSString stringWithFormat:@"%i", i]] dead]){
			
			if([[pigsDict objectForKey:[NSString stringWithFormat:@"%i", i]] life]-1 <= 0)
				[[pigsDict objectForKey:[NSString stringWithFormat:@"%i", i]] setDead:YES];
			else
				[(Pig*)[pigsDict objectForKey:[NSString stringWithFormat:@"%i", i]] setLife:([[pigsDict objectForKey:[NSString stringWithFormat:@"%i", i]] life]-1)]; 
			
		}
		
		//int n1 = [[pigsDict objectForKey:[NSString stringWithFormat:@"%i", i]] life]*100;
		//NSLog(@"Pig %i %i %i de %i", i, n1, n1/30, [[pigsDict objectForKey:[NSString stringWithFormat:@"%i", i]] life]);
		
	}
	
}

@end
