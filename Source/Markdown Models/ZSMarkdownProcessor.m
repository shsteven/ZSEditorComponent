//
//  ZSMarkdownProcessor.m
//  ZSEditorComponent
//
//  Created by Steve on 5/9/13.
//  Copyright (c) 2013 MagicalBits. All rights reserved.
//

#import "ZSMarkdownProcessor.h"
#import "ZSMarkdownToken.h"

@interface ZSMarkdownProcessor(){
    JSContext *_context;
    JSManagedValue *_markedPlugin;
}

@end


@implementation ZSMarkdownProcessor

- (id)init
{
    self = [super init];
    if (self) {
        [self loadMarkdownPlugin];
    }
    return self;
}

- (void)dealloc {
    [self unloadMarkdownPlugin];
}

#pragma mark -

- (void)loadMarkdownPlugin
{
    // Load the plugin script from the bundle.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"marked" ofType:@"js"];
    NSString *pluginScript = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    _context = [[JSContext alloc] init];
    
    // We insert the AppDelegate into the global object so that when we call
    // -addManagedReference:withOwner: for the plugin object we're about to load
    // and pass the AppDelegate as the owner, the AppDelegate itself is reachable from
    // within JavaScript. If we didn't do this, the AppDelegate wouldn't be reachable
    // from JavaScript, and there wouldn't be anything keeping the plugin object alive.
    _context[@"MarkdownProcessor"] = self;
    
    /*
    // Insert a block so that the plugin can create NSColors to return to us later.
    _context[@"makeNSColor"] = ^(NSDictionary *rgb){
        return [NSColor colorWithRed:[rgb[@"red"] floatValue] / 255.0f
                               green:[rgb[@"green"] floatValue] / 255.0f
                                blue:[rgb[@"blue"] floatValue] / 255.0f
                               alpha:1.0f];
    };
     */
    [_context evaluateScript:pluginScript];
    JSValue *plugin = [_context evaluateScript:@"marked"];
    
    _markedPlugin = [JSManagedValue managedValueWithValue:plugin];
    [_context.virtualMachine addManagedReference:_markedPlugin withOwner:self];
//    [self.window setDelegate:self];
}

- (void)unloadMarkdownPlugin
{
    [_context.virtualMachine removeManagedReference:_markedPlugin withOwner:self];
    _markedPlugin = nil;
    _context = nil;
}

#pragma mark -

- (NSArray *)tokensFromText: (NSString *)text {
    JSValue *plugin = [_markedPlugin value];
    JSValue *lexerFunction = plugin[@"lexer"];
    
    NSArray *jsTokens = [[lexerFunction callWithArguments:@[text]] toArray];
    
//    NSArray *tokens = [jsTokens valueForKeyPath:@"toObject"];
    NSLog(@"jsTokens: %@", jsTokens);
    
    return jsTokens;
}

/*
- (void)refreshColors
{
    // Get the words from the NSTextView.
    NSTextStorage *textStorage = [self.textView textStorage];
    NSString *textBody = [textStorage string];
    NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSArray *words = [textBody componentsSeparatedByCharactersInSet:whiteSpace];
    
    // Get the callback from the plugin.
    JSValue *plugin = [_markedPlugin value];
    JSValue *colorForWordFunction = plugin[@"colorForWord"];
    
    // Remove all the old formatting.
    [textStorage removeAttribute:NSBackgroundColorAttributeName range:NSMakeRange(0, [textBody length])];
    [textStorage removeAttribute:NSForegroundColorAttributeName range:NSMakeRange(0, [textBody length])];
    
    NSUInteger bodyOffset = 0;
    for (NSUInteger i = 0; i < [words count]; i++) {
        // Skip over whitespace at the end of words.
        while (bodyOffset < [textBody length] && [whiteSpace characterIsMember:[textBody characterAtIndex:bodyOffset]])
            bodyOffset++;
        
        NSString *word = [words objectAtIndex:i];
        NSRange wordRange = NSMakeRange(bodyOffset, [word length]);
        
        // Get the color from the plugin and highlight the word with it.
        NSColor *color = [[colorForWordFunction callWithArguments:@[word]] toObject];
        if (color) {
            [textStorage addAttribute:NSBackgroundColorAttributeName value:color range:wordRange];
            [textStorage addAttribute:NSForegroundColorAttributeName value:[NSColor whiteColor] range:wordRange];
        }
        
        bodyOffset += [word length];
    }
}
*/

@end
