//
//  VDEMyView.m
//  vincentd26_pickerView
//
//  Created by Utilisation on 21/05/14.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import "VDEMyView.h"


@implementation VDEMyView


//--------------------------------------------------------------------------------------------------------
-(id) initWithFrame:(CGRect)frame {
	//--------------------------------------------------------------------------------------------------------
    
    self= [super initWithFrame:frame ];
	
	
    if( self) {
        // recuperation du type de terminal
        if ( [[UIDevice currentDevice] userInterfaceIdiom ]== UIUserInterfaceIdiomPhone) {
            isIpad = NO;
        } else {
            isIpad = YES;
        }
    }
    
    //configuration subview du fond
    //--------------------------------------------------------------------------------------------------------
    //vdeImageEspace = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image2048_2048.png"]];
    //vdeImageEspace = [[UIImageView alloc] init];
    //[self addSubview:vdeImageEspace];
	
    
    //configuration du picker
    //--------------------------------------------------------------------------------------------------------
    vdePickerView = [[UIPickerView alloc] init];
	vdePickerView.delegate		= self;
	vdePickerView.dataSource	= self;
	
    [self addSubview:vdePickerView];
	
	vdeTableauPickerDonnees = [NSArray arrayWithObjects:
							   @[@"Avion",@"Voiture",@"Ordinateur",@"iPhone",@"iPod",@"Cube",@"iPad",@"Crayon",@"Papier"],
							   @[@"Rouge",@"Noir",@"Bleu",@"Jaune",@"Vert",@"Gris"],
							   nil];
	
	vdeTableauPickerCouleur = [NSArray arrayWithObjects:
							   [UIColor redColor],
							   [UIColor blackColor],
							   [UIColor blueColor],
							   [UIColor yellowColor],
							   [UIColor greenColor],
							   [UIColor grayColor],
							   nil];
				
	
    
	// configuration du label
	//--------------------------------------------------------------------------------------------------------
	vdeLabelTexteDuPicker					= [[UILabel alloc ]init];
	vdeLabelTexteDuPicker.TextAlignment		= NSTextAlignmentCenter;
	vdeLabelTexteDuPicker.font				= [UIFont boldSystemFontOfSize:18.0];
	vdeLabelTexteDuPicker.backgroundColor	= [UIColor colorWithRed:1 green:1 blue:1 alpha:0.6];
	[self pickerView:vdePickerView didSelectRow:0 inComponent:0];
	[self pickerView:vdePickerView didSelectRow:0 inComponent:1];
	[self addSubview:vdeLabelTexteDuPicker];
	
		
    // positionnement des frames
    //--------------------------------------------------------------------------------------------------------
    [self setFromOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
	// on recupere l'orientation de la status bar pour connaitre l'orientation ( astuce UPMC )
	
    
    
    return self;
}


- (void) setFromOrientation:(UIInterfaceOrientation) o {
	//--------------------------------------------------------------------------------------------------------
	
    
	
	// rafraichissement de la frame en fonction de l'orientation
	//--------------------------------------------------------------------------------------------------------
	
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	
    if (o == UIInterfaceOrientationLandscapeLeft || o==UIInterfaceOrientationLandscapeRight)
    {
		self.frame = CGRectMake(screenRect.origin.x, screenRect.origin.y, screenRect.size.height, screenRect.size.width);
    }else {
		self.frame = CGRectMake(screenRect.origin.x, screenRect.origin.y, screenRect.size.width, screenRect.size.height);
    }
	
	// Calcul des dimensiuons
	//--------------------------------------------------------------------------------------------------------
	
	int vdeLargeurVue, vdeHauteurVue;
    
	vdeLargeurVue = [self bounds].size.width;
	vdeHauteurVue = [self bounds].size.height;
	
	int vdeHauteurLabelTexteDuPicker		= 30;
	int vdeLargeurLabelTexteDuPicker		= vdeLargeurVue;
    int vdeXLabelTexteDuPicker				= 0;
    int vdeYLabelTexteDuPicker				= 35;
	
    int vdeHauteurPickerView	= 180.0;
	int vdeXPickerView			= 20;
    int vdeYPickerView			= 90;
    int vdeLargeurPickerView 	= vdeLargeurVue-40;
    
    
    // placement des subviews
    //--------------------------------------------------------------------------------------------------------
    
    [vdeLabelTexteDuPicker		setFrame:CGRectMake(vdeXLabelTexteDuPicker,
													vdeYLabelTexteDuPicker,
													vdeLargeurLabelTexteDuPicker,
													vdeHauteurLabelTexteDuPicker)];
    
    [vdePickerView				setFrame:CGRectMake(vdeXPickerView,
													vdeYPickerView,
													vdeLargeurPickerView,
													vdeHauteurPickerView)];
	
    
    
}

//--------------------------------------------------------------------------------------------------------
// LES DELEGATES DE PICKER VUE
//--------------------------------------------------------------------------------------------------------


-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	//--------------------------------------------------------------------------------------------
	// renvoi le nombre de composant
	
	return [vdeTableauPickerDonnees count];
}


-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	//--------------------------------------------------------------------------------------------
	// renvoi le nombre de valeurs PAR composant
	
	return [[vdeTableauPickerDonnees objectAtIndex:component] count];
}

-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	//--------------------------------------------------------------------------------------------
	// renvoi le contenu du composant
	
	return [[vdeTableauPickerDonnees objectAtIndex:component] objectAtIndex:row];
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
	//--------------------------------------------------------------------------------------------
	// invoqué à chaque modif du picker
	
	if( component == 0) { //on choisi l'objet dans le premier picker
		vdeNomObjetSelectionne = [[vdeTableauPickerDonnees objectAtIndex:component] objectAtIndex:row];
	} else { // on choisi la couleur
		vdeLabelTexteDuPicker.textColor = [vdeTableauPickerCouleur objectAtIndex:row];
	}
	vdeLabelTexteDuPicker.text = vdeNomObjetSelectionne;
	


}



//--------------------------------------------------------------------------------------------------------

@end

