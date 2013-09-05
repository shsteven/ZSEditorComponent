//
//  ZSTextTableViewCell.m
//  ZSEditorComponent
//
//  Created by Steve on 5/9/13.
//  Copyright (c) 2013 MagicalBits. All rights reserved.
//

#import "ZSTextTableViewCell.h"

@implementation ZSTextTableViewCell

+ (CGFloat)heightWithText: (NSString *)text {
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:14.0]
                   constrainedToSize:CGSizeMake(280, 100000)
                       lineBreakMode:NSLineBreakByWordWrapping];
    return size.height + 20.0;;
}

+ (CGFloat)heightWithToken: (NSDictionary *)token {
    NSString *text = token[@"text"];
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:14.0]
                   constrainedToSize:CGSizeMake(280, 100000)
                       lineBreakMode:NSLineBreakByWordWrapping];
    
    // Height should be larger than textView.contentSize.height
    // So that textview's scrolling won't interfere

    return size.height + 20.0;
}

@end
