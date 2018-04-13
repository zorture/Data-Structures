//
//  AppRunner.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/13/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "AppRunner.h"

@implementation AppRunner

+ (void)runApp{
    
    NSString* string = @"abcabcbb";
    //string = @"pwwkew";
    NSInteger ans = [LongestSubstring getLongestSubstringForString:string];
    NSLog(@"Longest Substring for string %@ is %ld",string, (long)ans);
}

@end
