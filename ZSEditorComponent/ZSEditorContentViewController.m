//
//  ZSEditorContentViewController.m
//  ZSEditorComponent
//
//  Created by Steve on 5/9/13.
//  Copyright (c) 2013 MagicalBits. All rights reserved.
//

#import "ZSEditorContentViewController.h"
#import "ZSTextTableViewCell.h"
#import "ZSMarkdownToken.h"
#import "ZSMarkdownProcessor.h"

@interface ZSEditorContentViewController () {

    
}

@property (strong) ZSMarkdownProcessor *textProcessor;

@end

@implementation ZSEditorContentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textProcessor = [[ZSMarkdownProcessor alloc] init];
    
    NSString *text =@"> This is markdown!";
    
    self.contentItems = [[self.textProcessor tokensFromText:text] mutableCopy];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.contentItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = self.contentItems[indexPath.row];
    
    NSString *type = dict[@"type"];
    if ([type isEqualToString:@"paragraph"]) {
        static NSString *TextCellIdentifier = @"TextCell";
        ZSTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TextCellIdentifier forIndexPath:indexPath];
        
        NSString *text = dict[@"text"];
        
        cell.textView.text = text;
        
        return cell;
        
    }
    
    static NSString *CellIdentifier = @"TextCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    
    // Configure the cell...
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = self.contentItems[indexPath.row];
    NSString *type = dict[@"type"];

    if ([type isEqualToString:@"paragraph"]) {
        NSString *text = dict[@"text"];
        
        CGFloat height = [ZSTextTableViewCell heightWithText:text];
        return height;
    }
    
    return 0.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = self.contentItems[indexPath.row];
    NSString *type = dict[@"type"];
    
    if ([type isEqualToString:@"paragraph"]) {
        NSString *text = dict[@"text"];
        
        CGFloat height = [ZSTextTableViewCell heightWithText:text];
        return height;
    }
    
    return 0.0;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
