//
//  ZSMarkdownToken.h
//  ZSEditorComponent
//
//  Created by Steve on 5/9/13.
//  Copyright (c) 2013 MagicalBits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface ZSMarkdownToken : NSObject <JSExport>

@property (copy) NSString *text;
@property (copy) NSString *type;
@property (strong) NSArray *links;

@end
