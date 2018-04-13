//
//  LongestSubstring.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/13/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "LongestSubstring.h"

@implementation LongestSubstring

+ (NSString*)charAtIndex:(NSInteger)index ForString:(NSString*)string {
    
    unichar value = [string characterAtIndex:index];
    NSString *str = [NSString stringWithFormat: @"%C", value];
    return str;
}

+ (NSInteger)getLongestSubstringForString:(NSString*)string{
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
@end
