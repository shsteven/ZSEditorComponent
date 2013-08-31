//
//  ZSEditorContentViewController.m
//  ZSEditorComponent
//
//  Created by Steve on 31/8/13.
//  Copyright (c) 2013 MagicalBits. All rights reserved.
//

#import "ZSEditorContentViewController.h"


@interface ZSEditorContentViewController ()

@end

@implementation ZSEditorContentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.contentItems = self.contentItems ?: [NSMutableArray new];

    NSDictionary *dict =@{@"type":@"text",
                          @"text":@"A quick fox"};
    
    for (NSInteger i = 0; i < 50; i++) {
        [self.contentItems addObject:[dict copy]];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Collection view


- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return [self.contentItems count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dict = self.contentItems[indexPath.row];

    NSString *type = dict[@"type"];
    
    if ([type isEqualToString:@"text"]) {
        ZSTextViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TextCell"
                                                                                       forIndexPath:indexPath];
        cell.textView.text = dict[@"text"];
        return cell;
    }
    
    return [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell"
                                                     forIndexPath:indexPath];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    UIFont *font = [UIFont boldSystemFontOfSize:18];
    NSDictionary *dict = self.contentItems[indexPath.row];
    
    NSString *type = dict[@"type"];
    
    if ([type isEqualToString:@"text"]) {
        NSString *text = dict[@"text"];
        CGSize size =[text sizeWithFont:font
                      constrainedToSize:CGSizeMake(300, 10000)
                          lineBreakMode:NSLineBreakByWordWrapping];
        
        size.width = 320;
        return size;
    }
    return CGSizeMake(320, 200);
}


#pragma mark - Text view cell delegate


- (BOOL)textViewCellShouldBeginEditing: (ZSTextViewCollectionViewCell *)cell {
    return YES;
}

- (void)textViewCellDidBeginEditing:(ZSTextViewCollectionViewCell *)cell {
    
}

@end
