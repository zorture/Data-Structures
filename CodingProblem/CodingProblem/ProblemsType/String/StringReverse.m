//
//  StringReverse.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/17/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "StringReverse.h"
#import "AppRunner.h"
#import <string.h>

static StringReverse* sharedStringReverse;

@interface StringReverse()
@property(nonatomic,strong)NSArray* inputAr;
@end

@implementation StringReverse

+ (void)runStringReverse{
    sharedStringReverse = [[StringReverse alloc] init];
    [sharedStringReverse findSolution];
}

- (instancetype)init{
    self = [super init];
    return self;
}

- (void)findSolution{
    
    char str[]="ab";
    reverse(str);
    
    char a[] = "a";
    char b[] = "b";
    a[0] = a[0] ^ b[0];
    b[0] = a[0] ^ b[0];
    a[0] = a[0] ^ b[0];
    
    int aa = 1;
    int bb = 2;
    
    aa = aa ^ bb;
    bb = aa ^ bb;
    aa = aa ^ bb;
    
    
}



void reverse(char* str)
{
    
    int i, j, len;
    char temp;
    i=j=len=temp=0;
    
    j=strlen(str) - 1;
    while(i < j)
    {
        str[i] = str[i] ^ str[j];
        str[j] = str[i] ^ str[j];
        str[i] = str[i] ^ str[j];
        i++;j--;
    }
    
    NSLog(@"%s",str);
}

@end
