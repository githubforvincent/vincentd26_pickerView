//
//  VDEMyView.h
//  vincentd26_pickerView
//
//  Created by Utilisation on 21/05/14.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface VDEMyView : UIView <UIPickerViewDataSource, UIPickerViewDelegate> {
	
	UIPickerView        *vdePickerView;
	UILabel             *vdeLabelTexteDuPicker;
	
	NSArray				*vdeTableauPickerDonnees;
	NSArray				*vdeTableauPickerCouleur;
	
	NSString			*vdeNomObjetSelectionne;
	
	CGRect				vdeMaFrame;
	BOOL				isIpad;
}
- (void) setFromOrientation:(UIInterfaceOrientation) o;

@end

