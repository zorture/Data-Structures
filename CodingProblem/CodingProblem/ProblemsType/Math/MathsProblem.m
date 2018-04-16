//
//  MathsProblem.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/15/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "MathsProblem.h"

static MathsProblem* sharedMathsProblem;

@interface MathsProblem()
@property(nonatomic,strong)NSArray* inputAr;

@end

@implementation MathsProblem

+ (void)runMathsProblem{
    sharedMathsProblem = [[MathsProblem alloc] init];
    [sharedMathsProblem findSolution];
}

- (instancetype)init{
    self = [super init];
    return self;
}

- (void)findSolution{
    NSInteger square = [self findSquare:2];
    NSLog(@"%ld",(long)square);
    [self findSquareRoot:49];
    [self shiftBits];
}

- (void)shiftBits{
    int a =1;
    NSLog(@"%d", a << 2);
    NSLog(@"%d", a >> 1);
    
    
}

- (NSInteger)findSquareRoot:(NSInteger)number{
    float i;
    for (i=0.01; i*i<number; i+=0.01);
    
    NSLog(@"%0.02f",i);
    return 0;
}

- (NSInteger)findSquare:(NSInteger)number{
    // Base case
    if (number==0) return 0;
    
    // Handle negative number
    if (number < 0) number = -number;
    
    // Get floor(n/2) using right shift
    NSInteger x = number>>1;
    NSInteger val;
    // If n is odd
    if (number&1)
        val = (([self findSquare:x] << 2) + (x << 2) + 1);
    else
        val = ([self findSquare:x] << 2);
    return val;
}

@end
