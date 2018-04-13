//
//  ReverseDigits.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/13/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "ReverseDigits.h"

@implementation ReverseDigits

+ (void)runReverseDigits{
    NSInteger ans = [ReverseDigits getReverseNumber:12345678909];
    NSLog(@"%ld",ans);
}

+ (NSInteger)getReverseNumber:(NSInteger)number{
    
    NSInteger rev_num = 0;
    while (number > 0)
    {
        rev_num = rev_num*10 + number%10;
        number = number/10;
    }
    return rev_num;
    
}
@end
