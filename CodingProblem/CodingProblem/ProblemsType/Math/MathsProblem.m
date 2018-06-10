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
    NSInteger square = [self findSquare:3];
    NSLog(@"%ld",(long)square);
    [self findSquareRoot:49];
    [self shiftBits];
    
    atoiTheString("123");
    int arr[] = {5,2,3,1,1 };
    int n = sizeof(arr)/sizeof(arr[0]);
    divideIntArray(arr,n);
}

- (void)shiftBits{
    int a =1;
    NSLog(@"%d", a << 2);
    NSLog(@"%d", a >> 1);
    
    
}

- (NSInteger)findSquareRoot:(NSInteger)number{
    // Base cases
    if (number == 0 || number == 1)
        return number;
    
    // Staring from 1, try all numbers until
    // i*i is greater than or equal to x.
    int i = 1, result = 1;
    while (result < number)
    {
        if (result == number)
            return result;
        i++;
        result = i*i;
    }
    return i-1;
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

int atoiTheString(char *s)
{
    int result = 0;
    
    while (*s)
        result = 10*result + *s++ - '0';
    
    return result;
}

int findSplitPoint(int arr[], int n)
{
    int leftSum = 0 ;
    
    // traverse array element
    for (int i = 0; i < n; i++)
    {
        // add current element to left Sum
        leftSum += arr[i] ;
        
        // find sum of rest array elements (rightSum)
        int rightSum = 0 ;
        for (int j = i+1 ; j < n ; j++ )
            rightSum += arr[j] ;
        
        // split point index
        if (leftSum == rightSum)
            return i+1 ;
    }
    
    // if it is not possible to split array into
    // two parts
    return -1;
}

void divideIntArray(int arr[], int n)
{
    int splitPoint = findSplitPoint(arr, n);
    
    if (splitPoint == -1 || splitPoint == n )
    {
        return;
    }
    for (int i = 0; i < n; i++)
    {
        if(splitPoint == i)
            NSLog(@"%d",arr[i]);
        
    }
}

@end
