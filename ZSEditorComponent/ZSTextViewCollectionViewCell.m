//
//  ZSTextViewCollectionViewCell.m
//  ZSEditorComponent
//
//  Created by Steve on 31/8/13.
//  Copyright (c) 2013 MagicalBits. All rights reserved.
//

#import "ZSTextViewCollectionViewCell.h"

@implementation ZSTextViewCollectionViewCell

+ (CGSize)sizeWithText: (NSString *)text {
    UIFont *font = [UIFont boldSystemFontOfSize:18];

    CGSize size = [text sizeWithFont:font
                   constrainedToSize:CGSizeMake(300, 10000)
                       lineBreakMode:NSLineBreakByWordWrapping];
    
    size.width = 320;
    return size;
}

- (void)awakeFromNib {
    self.textView.layoutManager.delegate = self;
}

- (void)dealloc {
    self.textView.layoutManager.delegate = nil;
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
}

- (BOOL)layoutManager:(NSLayoutManager *)layoutManager shouldBreakLineByHyphenatingBeforeCharacterAtIndex:(NSUInteger)charIndex {
    
    NSLog(@"making new line");
    return YES;
}

- (BOOL)layoutManager:(NSLayoutManager *)layoutManager shouldBreakLineByWordBeforeCharacterAtIndex:(NSUInteger)charIndex {
    NSLog(@"making new line");
    
    // adjust cell size
    [self.delegate textViewCellDidChangeSize:self];
    
    return YES;
}

@end
