//
//  VDEViewController.m
//  vincentd26_pickerView
//
//  Created by Utilisation on 21/05/14.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import "VDEViewController.h"



@interface VDEViewController ()

@end

@implementation VDEViewController

-(BOOL) shouldAutorotate {
	//--------------------------------------------------------------------------------------------------------
    return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)o duration:(NSTimeInterval)d
//--------------------------------------------------------------------------------------------------------
{
    [vue setFromOrientation:o];
    
}
- (void)viewDidLoad {
	//--------------------------------------------------------------------------------------------------------
    
    [super viewDidLoad];
    vue = [[VDEMyView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [[self view] addSubview:vue];}

- (void)didReceiveMemoryWarning {
	//--------------------------------------------------------------------------------------------------------
    [super didReceiveMemoryWarning];
    NSLog(@"Alerte mémoire");
    
    
}



@end