// This file was autogenerated from Tests/html5lib/tokenizer/unicodeCharsProblematic.test.

#import <SenTestingKit/SenTestingKit.h>
#import "HTMLTokenizerTestUtilities.h"

@interface TokenizerUnicodeCharsProblematicTests : SenTestCase

@end

@implementation TokenizerUnicodeCharsProblematicTests
        
- (void)test0
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError",@[@"Character",@"\\U0000FFFD"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\\U0000DFFF" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Invalid Unicode character U+DFFF");
    }
}
        
- (void)test1
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError",@[@"Character",@"\\U0000FFFD"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\\U0000D800" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Invalid Unicode character U+D800");
    }
}
        
- (void)test2
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError",@[@"Character",@"a\\U0000FFFD"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"a\\U0000DFFF" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Invalid Unicode character U+DFFF with valid preceding character");
    }
}
        
- (void)test3
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError",@[@"Character",@"\\U000FFFDa"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\\U000D800a" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Invalid Unicode character U+D800 with valid following character");
    }
}
        
- (void)test4
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character",@"\n"],@"ParseError",@[@"Character",@"\x00"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\r\x00" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"CR followed by U+0000");
    }
}

@end
