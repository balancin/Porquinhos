//Grid.m
#import "Grid.h"

@implementation Grid

-(void) initWithView:(UIView*)viewScene {
	
	//Diretorio que se encontra o som
	NSString *sndPath = [[NSBundle mainBundle]
								pathForResource:@"squeeze-toy-2"
								ofType:@"wav"]; 
	//Referencia do caminho do som
	CFURLRef sndURL = (CFURLRef)[[NSURL alloc]
										initFileURLWithPath:sndPath];
	//Criando objeto do som
	AudioServicesCreateSystemSoundID(sndURL, &up_life);
	
	//Setando o numero de mortes para 0
	deads = 0;
	
	//recebendo o palco
	view = viewScene; 
	
	//Configura textos iniciais
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
	
	//Cria referencia de imagem do porquinho
	UIImage* image = [UIImage imageNamed:@"pig_s1.png"];
	
	//Adiciona porcos na tela
	for(int i = 0; i < 9; i++){ 
		
		Pig* imageView = [[Pig alloc] initWithImage:image];
		imageView.pigId = i;
		imageView.tag = i;
		imageView.frame = CGRectMake((i%3)*image.size.width+35, ((i-(i%3))/3)*image.size.height+100, image.size.width, image.size.height); //(i%3)*image.size.height
		imageView.dead = NO;
		imageView.life = 30;
		[pigsDict setObject:imageView forKey:[NSString stringWithFormat:@"%i", i]];
		
		[view addSubview:imageView];
		
	}
	
	//Cria pilula na tela
	UIImage* pillImage = [UIImage imageNamed:@"pill.png"];
	Pill* pill = [[Pill alloc] initWithImage:pillImage];
	pill.pigsDict = pigsDict;
	pill.up_life = up_life;
	pill.userInteractionEnabled = YES;
	pill.frame = CGRectMake(20, 350, pillImage.size.width, pillImage.size.height);
	[viewScene addSubview:pill];
	
	UIImage* pillIndicateImage = [UIImage imageNamed:@"useit.png"];
	UIImageView* pillIdicate = [[UIImageView alloc] initWithImage:pillIndicateImage];
	pillIdicate.frame = CGRectMake(pill.frame.origin.x+pillImage.size.width+10, pill.frame.origin.y+5, pillIndicateImage.size.width, pillIndicateImage.size.height);
	[viewScene addSubview:pillIdicate];  
	
}

-(void) mainLoop {

	//Começa contador de tempo
	mainTime = mainTime+1; 
	
	//Verifica se morreram todos os porcos
	if(deads == 9){
		
		//Game over
		[mainLoop invalidate]; 
		deadsLabel.text = @"Game Over !";
		
	} else {
	
		//Verifica se o tempo acabou
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
				
			}
			
		}
		
	}
	
	timeCounter--;
	timeLabel.text = [NSString stringWithFormat:@"%i segundo(s)", timeCounter];
	
}

@end
