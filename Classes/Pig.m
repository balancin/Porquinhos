//Pig.m
#import "Pig.h"

@implementation Pig

@synthesize pigId, dead;

-(int)life {
	return life;
}

-(void)setLife:(int)s {
	//Altera a imagem do porquinho para a imagem que representa o estado atual dele
	life = s;
	int n1 = life*100;
	int nIm = 11-(10*(n1/30)/100);
	if(nIm < 11)
		self.image = [UIImage imageNamed:[NSString stringWithFormat:@"pig_s%i.png", nIm]];
}

- (void)dealloc {
    [super dealloc];
}

@end