//
//  PalindromicSubstring.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/13/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "PalindromicSubstring.h"

@implementation PalindromicSubstring

+ (void)runPalindromicSubstring{
    NSInteger ans = [PalindromicSubstring getLongestPalindromicSubstringForString:@"abaaba"];
    NSLog(@"Longest Length:: %ld", ans);
}

+ (NSInteger)getLongestPalindromicSubstringForString:(NSString*)string{
    
    NSString* formatedString = [PalindromicSubstring newStringForString:string];
    NSMutableArray* ar = [NSMutableArray array];
    
    for ( int i = 0; i< formatedString.length; i++){
        [ar addObject:@"0"];
    }
    
    for (int i = 0; i < formatedString.length; i++){
        if (i == 0 || i == formatedString.length-1){
            [ar replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"0"]];
        }
        else{
            int count = 0;
            int leftIndex = i-1;
            int righIndex = i+1;
            
            NSString* charAr = [AppRunner charAtIndex:i ForString:formatedString];
            if (![charAr isEqualToString:@"#"]){
                leftIndex--;
                righIndex++;
                count++;
            }
            while (leftIndex > -1 && righIndex < formatedString.length ) {
                NSString* leftStr = [AppRunner charAtIndex:leftIndex-- ForString:formatedString];
                NSString* righStr = [AppRunner charAtIndex:righIndex++ ForString:formatedString];
                if ([leftStr isEqualToString:righStr]){
                    if (![leftStr isEqualToString:@"#"]){
                        leftIndex--;
                        righIndex++;
                        count += 2;
                    }else{
                        count ++;
                    }
                    [ar replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",count]];
                }else{
                    [ar replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"0"]];
                    break;
                }
            }
        }
    }
    
    NSNumber * max = [ar valueForKeyPath:@"@max.intValue"];
    
    
    return max.integerValue;
}

+(NSString*)newStringForString:(NSString*)string{
    
    NSString* finalString = @"";
    for (int i = 0; i < string.length; i++){
        unichar value = [string characterAtIndex:i];
        NSString *str = [NSString stringWithFormat: @"#%C", value];
        finalString = [finalString stringByAppendingString:str];
    }
    
    return finalString;
}

@end
