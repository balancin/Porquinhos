//Grid.h 
#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "Pig.h"
#import "Pill.h"

@interface Grid : NSObject {

	NSMutableDictionary* pigsDict; //Matriz onde ficarao armazenados os objetos dos porquinhos
	int mainTime; //tempo de jogo
	UIView* view; //palco
	UILabel* deadsLabel; //campo de texto das mortes
	UILabel* timeLabel; //campo de texto do tempo
	int timeCounter; //contador de tempo
	int deads; //numero de mortes
	NSTimer* mainLoop; //controlador principal de loop do jogo
	SystemSoundID up_life; //referencia do som que sera usado
	
}

-(void) mainLoop; //metodo do mainloop
-(void) initWithView:(UIView*)viewScene; //metodo que sera chamado pelo arquivo principal

@end
