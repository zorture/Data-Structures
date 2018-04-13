//
//  ZigZagString.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/13/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "ZigZagString.h"

@implementation ZigZagString

+ (void)runZigZagString{
 
    NSString* ans = [ZigZagString readZigZagStringFromString:@"ABCDEFGH" FroRows:2];
}

+ (NSString*)readZigZagStringFromString:(NSString*)string FroRows:(NSInteger)row{
    
    if (row == 1) {
        return string;
    }
    
    NSInteger len = string.length;
    NSMutableArray *strAr = [NSMutableArray arrayWithCapacity:row];
    
    for (int i = 0; i < len; i++){
        [strAr addObject:@""];
    }
    
    NSInteger index = 0;
    BOOL down = NO;
    
    for (int i = 0; i < len; ++i){
        NSString* charAr = [AppRunner charAtIndex:i ForString:string];
        [strAr replaceObjectAtIndex:index withObject:charAr];
        
        if (index == row-1)
            down = NO;
        else if (index == 0)
            down = YES;
        
        down ? index++ : index--;
    }
    
    NSString * result = [[strAr valueForKey:@"description"] componentsJoinedByString:@""];
    
    return result;
}

@end
