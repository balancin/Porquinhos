//Pill.m

#import "Pill.h"

@implementation Pill

@synthesize pigsDict, up_life; 

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	//Cria uma replica da pilula que sera arrastada
	pillActiveView = [[UIImageView alloc] initWithImage:self.image];
	pillActiveView.frame = self.frame;
	
	[self.superview addSubview:pillActiveView];

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	//Move a pilula na tela
	UITouch* allTouches = [touches anyObject];
	CGPoint location = [allTouches locationInView:self.superview];
	
	pillActiveView.center = CGPointMake(location.x, location.y); 
	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

	//Detecta em que porquinho a pilula foi colocada ou se nao foi em um e deleta a pilula da tela
	UITouch* allTouches = [touches anyObject];
	CGPoint location = [allTouches locationInView:self.superview];
	if(location.x >= [[pigsDict objectForKey:@"0"] frame].origin.x && location.x <= [[pigsDict objectForKey:@"2"] frame].origin.x+[[pigsDict objectForKey:@"2"] frame].size.width){
		
		float xPos = ceil((location.x-[[pigsDict objectForKey:@"0"] frame].origin.x)/[[pigsDict objectForKey:@"2"] frame].size.width)-1;
		float yPos = ceil((location.y-[[pigsDict objectForKey:@"0"] frame].origin.y)/[[pigsDict objectForKey:@"6"] frame].size.height)-1;
		int pigId = xPos+(yPos*3);
		if(![[pigsDict objectForKey:[NSString stringWithFormat:@"%i", pigId]] dead]){
			AudioServicesPlaySystemSound(up_life);
			[[pigsDict objectForKey:[NSString stringWithFormat:@"%i", pigId]] setLife:30];
		}
		
	}
	
	[pillActiveView removeFromSuperview];
	
} 

- (void)dealloc {
    [super dealloc];
}

@end
