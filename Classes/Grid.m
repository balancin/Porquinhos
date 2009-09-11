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

	deads = 0;
	view = viewScene; 
	
	deadsLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 75, 190, 30)];
	deadsLabel.font = [UIFont fontWithName:@"Arial" size:20];
	deadsLabel.backgroundColor = [UIColor clearColor];
	deadsLabel.textAlignment = UITextAlignmentLeft;
	deadsLabel.text = @"(0) porcos perdidos";
	[viewScene addSubview:deadsLabel];
	
	timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 55, 140, 30)];
	timeLabel.font = [UIFont fontWithName:@"Arial" size:20];
	timeLabel.backgroundColor = [UIColor clearColor];
	timeLabel.textAlignment = UITextAlignmentLeft;
	timeCounter = 60;
	timeLabel.text = @"90 segundo(s)";
	[viewScene addSubview:timeLabel];
	
	mainLoop = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(mainLoop) userInfo:nil repeats:YES];
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
		imageView.pigsDict = pigsDict;
		imageView.dead = NO;
		imageView.life = 30;
		[pigsDict setObject:imageView forKey:[NSString stringWithFormat:@"%i", i]];
		
		[view addSubview:imageView];
		
	}
	
	UIImage* pillImage = [UIImage imageNamed:@"pill.png"];
	Pill* pill = [[Pill alloc] initWithImage:pillImage];
	pill.pigsDict = pigsDict;
	pill.userInteractionEnabled = YES;
	pill.frame = CGRectMake(20, 350, pillImage.size.width, pillImage.size.height);
	[viewScene addSubview:pill];
	
	UIImage* pillIndicateImage = [UIImage imageNamed:@"useit.png"];
	UIImageView* pillIdicate = [[UIImageView alloc] initWithImage:pillIndicateImage];
	pillIdicate.frame = CGRectMake(pill.frame.origin.x+pillImage.size.width+10, pill.frame.origin.y+5, pillIndicateImage.size.width, pillIndicateImage.size.height);
	[viewScene addSubview:pillIdicate];  
	
//	UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
//	imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
//	
//	[view addSubview:imageView];
	
	
}

-(void) mainLoop {

	mainTime = mainTime+1;
	NSLog(@"mainTime %i", mainTime);
	
	if(deads == 9){
		
		[mainLoop invalidate]; 
		deadsLabel.text = @"Game Over !";
		
	} else {
	
		if(timeCounter <= 1){
			
			deadsLabel.text = [NSString stringWithFormat:@"Você conseguiu !", deads];	
			[mainLoop invalidate]; 
			
		} else {
			
			for(int i = 0; i < 9; i++){ 
				
				if(![[pigsDict objectForKey:[NSString stringWithFormat:@"%i", i]] dead]){
					
					if([[pigsDict objectForKey:[NSString stringWithFormat:@"%i", i]] life]-1 <= 0){
						[[pigsDict objectForKey:[NSString stringWithFormat:@"%i", i]] setDead:YES];
						deads++;
						deadsLabel.text = [NSString stringWithFormat:@"(%i) Perdidos", deads];
					} else
						[(Pig*)[pigsDict objectForKey:[NSString stringWithFormat:@"%i", i]] setLife:([[pigsDict objectForKey:[NSString stringWithFormat:@"%i", i]] life]-1)]; 
					
				}
				
				//int n1 = [[pigsDict objectForKey:[NSString stringWithFormat:@"%i", i]] life]*100;
				//NSLog(@"Pig %i %i %i de %i", i, n1, n1/30, [[pigsDict objectForKey:[NSString stringWithFormat:@"%i", i]] life]);
				
			}
			
		}
		
	}
	
	timeCounter--;
	timeLabel.text = [NSString stringWithFormat:@"%i segundo(s)", timeCounter];
	
}

@end
