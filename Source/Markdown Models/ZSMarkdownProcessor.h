//
//  ZSMarkdownProcessor.h
//  ZSEditorComponent
//
//  Created by Steve on 5/9/13.
//  Copyright (c) 2013 MagicalBits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface ZSMarkdownProcessor : NSObject 

// Returns an array of dictionaries
- (NSArray *)tokensFromText: (NSString *)text;

@end
