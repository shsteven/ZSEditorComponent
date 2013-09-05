//
//  ZSTextTableViewCell.m
//  ZSEditorComponent
//
//  Created by Steve on 5/9/13.
//  Copyright (c) 2013 MagicalBits. All rights reserved.
//

#import "ZSTextTableViewCell.h"

@implementation ZSTextTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)heightWithText: (NSString *)text {
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:18.0]
                   constrainedToSize:CGSizeMake(320, 10000)
                       lineBreakMode:NSLineBreakByWordWrapping];
    return size.height + 10.0;;
}

@end
