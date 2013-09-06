//
//  ZSEditorContentViewController.h
//  ZSEditorComponent
//
//  Created by Steve on 5/9/13.
//  Copyright (c) 2013 MagicalBits. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZSEditorViewController;

@interface ZSEditorContentViewController : UITableViewController <UITextViewDelegate>

@property (strong) NSMutableArray *contentTokens;
@property (weak) ZSEditorViewController *enclosingViewController;

@property (weak) UITextView *activeTextView;
@end
