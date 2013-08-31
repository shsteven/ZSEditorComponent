//
//  ZSTextViewCollectionViewCell.h
//  ZSEditorComponent
//
//  Created by Steve on 31/8/13.
//  Copyright (c) 2013 MagicalBits. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZSTextViewCollectionViewCell;

@protocol ZSTextViewCollectionViewCellDelegate <NSObject>

- (BOOL)textViewCellShouldBeginEditing: (ZSTextViewCollectionViewCell *)cell;
- (void)textViewCellDidBeginEditing:(ZSTextViewCollectionViewCell *)cell;

@end

@interface ZSTextViewCollectionViewCell : UICollectionViewCell <UITextViewDelegate>

@property (strong) IBOutlet UITextView *textView;
@property (weak) id <ZSTextViewCollectionViewCellDelegate> delegate;

@end
