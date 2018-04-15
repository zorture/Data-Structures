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
    
    [LongestSubstring runLongestSubstring];
    [MedianInArrays runMedianInArrays];
    [PalindromicSubstring runPalindromicSubstring];
    [ZigZagString runZigZagString];
    [ReverseDigits runReverseDigits];
    [PhoneNumberLetter runPhoneNumberLetter];
    [MergeSortedLists runMergeSortedLists];
    [ReverseList runReverseList];
    [NQueenProblem runNQueenProblem];
    [SubsetSums runSubsetSums];
    [CombinationSum runCombinationSum];
    [Duplicates runDuplicates];
    [FirstMissing runFirstMissing];
    [StackSort runStackSort];
    
}

+ (NSString*)charAtIndex:(NSInteger)index ForString:(NSString*)string {
    
    unichar value = [string characterAtIndex:index];
    NSString *str = [NSString stringWithFormat: @"%C", value];
    return str;
}


@end
