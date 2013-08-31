//
//  ZSEditorViewController.m
//  ZSEditorComponent
//
//  Created by Steve on 31/8/13.
//  Copyright (c) 2013 MagicalBits. All rights reserved.
//

#import "ZSEditorViewController.h"

@interface ZSEditorViewController ()

@end

@implementation ZSEditorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleButton:(id)sender {
    [self toggleKeyboardVisible];
}


- (void)toggleKeyboardVisible {
    CGFloat height = self.keyboardHeight.constant == 0 ? 200 : 0;
    [UIView animateWithDuration:1.0
                     animations:^{
                         self.keyboardHeight.constant = height;
                         [self.view setNeedsLayout];
                         [self.view layoutIfNeeded];
                     }];
}

@end
