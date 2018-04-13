//
//  LongestSubstring.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/13/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "LongestSubstring.h"

@implementation LongestSubstring

+ (void)runLongestSubstring{
    NSString* string = @"abcabcdbb";
    //string = @"pwwkew";
    NSInteger ans = [LongestSubstring getWithSetLongestSubstringForString:string];
    NSLog(@"Longest Substring for string %@ is %ld",string, (long)ans);
    ans = [LongestSubstring getWithDictionaryLongestSubstringForString:string];
    NSLog(@"Longest Substring for string %@ is %ld",string, (long)ans);
}

+ (NSString*)charAtIndex:(NSInteger)index ForString:(NSString*)string {
    
    unichar value = [string characterAtIndex:index];
    NSString *str = [NSString stringWithFormat: @"%C", value];
    return str;
}

+ (NSInteger)getWithSetLongestSubstringForString:(NSString*)string{
    NSInteger count = string.length;
    NSMutableSet* set = [NSMutableSet set];
    
    NSInteger ans = 0, i = 0, j = 0;
    int loopCount = 0;
    while (i < count && j < count){
        loopCount++;
        NSString* charAt = [LongestSubstring charAtIndex:j ForString:string];
        if (![set containsObject:charAt]){
            NSString* charAt = [LongestSubstring charAtIndex:j++ ForString:string];
            [set addObject:charAt];
            ans = MAX(ans, j-i);
        }else{
            NSString* charAt = [LongestSubstring charAtIndex:i++ ForString:string];
            [set removeObject:charAt];
        }
    }
    NSLog(@"Set Solution Loop Count:: %d",loopCount);
    return ans;
}

+ (NSInteger)getWithDictionaryLongestSubstringForString:(NSString*)string{
    
    NSInteger count = string.length;
    NSInteger ans = 0;
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    int loopCount = 0;
    for (NSInteger j = 0, i = 0; j < count; j++ ){
        loopCount++;
        NSString* charAt = [LongestSubstring charAtIndex:j ForString:string];
        if ([dict objectForKey:charAt]){
            NSNumber* value = [dict valueForKey:charAt];
            i = MAX([value integerValue], i);
        }
        ans = MAX(ans, j - i);
        [dict setObject:[NSNumber numberWithInt:(int)j] forKey:charAt];
    }
    NSLog(@"Dictionary Solution Loop Count:: %d",loopCount);
    return ans;
}
@end
