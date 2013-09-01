//
//  ZSEditorContentViewController.h
//  ZSEditorComponent
//
//  Created by Steve on 31/8/13.
//  Copyright (c) 2013 MagicalBits. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZSTextViewCollectionViewCell.h"

typedef NS_ENUM(NSInteger, ZSEditorContentItemType) {
    kEditorContentItemTypeText = 0,
    kEditorContentItemTypeImage
};

@interface ZSEditorContentViewController : UICollectionViewController <ZSTextViewCollectionViewCellDelegate>

@property (strong) NSMutableArray *contentItems;

/*
 KVO
 */
@property (assign) ZSEditorContentItemType currentContentType;

@end

