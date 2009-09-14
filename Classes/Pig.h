//Pig.h 
#import <UIKit/UIKit.h>

@interface Pig : UIImageView {

	int pigId; //indice de referencia do porquinho
	BOOL dead; //flag dizendo se o porco esta morto
	int life; //vida do porquinho
	
}

-(int)life; //retorna a vida
-(void)setLife:(int)s; //altera a vida

@property(nonatomic, readwrite) int pigId;
@property(nonatomic, readwrite) BOOL dead;

@end