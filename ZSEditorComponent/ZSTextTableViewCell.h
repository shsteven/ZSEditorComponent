//
//  ZSTextTableViewCell.h
//  ZSEditorComponent
//
//  Created by Steve on 5/9/13.
//  Copyright (c) 2013 MagicalBits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSTextTableViewCell : UITableViewCell

@property (strong) IBOutlet UITextView *textView;

+ (CGFloat)heightWithText: (NSString *)text;
+ (CGFloat)heightWithToken: (NSDictionary *)token;

@end
