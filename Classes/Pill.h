//Pill.h 

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface Pill : UIImageView {

	UIImageView* pillActiveView; //objeto com a imagem da pilula
	NSMutableDictionary* pigsDict; //matriz com objetos dos porquinhos
	SystemSoundID up_life; //objeto de som
	
}

@property(nonatomic, retain) NSMutableDictionary* pigsDict;
@property(nonatomic, readwrite) SystemSoundID up_life;

@end
