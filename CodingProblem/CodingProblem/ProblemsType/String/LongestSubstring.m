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
    NSString* string = @"abcabcbb";
    //string = @"pwwkew";
    NSInteger ans = [LongestSubstring getWithSetLongestSubstringForString:string];
    NSLog(@"Longest Substring for string %@ is %ld",string, (long)ans);
    ans = [LongestSubstring getWithSetLongestSubstringForString:string];
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
    
    while (i < count && j < count){
        
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
    return ans;
}

+ (NSInteger)getWithDictionaryLongestSubstringForString:(NSString*)string{
    
    NSInteger count = string.length;
    NSInteger ans = 0;
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    for (NSInteger j = 0, i = 0; j < count; j++ ){
        NSString* charAt = [LongestSubstring charAtIndex:j ForString:string];
        if ([dict objectForKey:charAt]){
            NSNumber* value = [dict valueForKey:charAt];
            i = MAX([value integerValue], i);
        }
        ans = MAX(ans, j - 1 + 1);
        [dict setObject:[NSNumber numberWithInt:(int)j+1] forKey:charAt];
    }
    return ans;
}
@end
