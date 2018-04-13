//
//  MedianInArrays.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/13/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "MedianInArrays.h"

@implementation MedianInArrays

+ (void)runMedianInArrays{
    
    NSArray* firstArray = [NSArray arrayWithObjects:@"1",@"3", nil];
    NSArray* secondArray = [NSArray arrayWithObjects:@"2",@"4",@"6", nil];
    NSString* ans = [MedianInArrays getMedianForFirstArrays:firstArray SecondArray:secondArray];
    NSLog(@"Answere is:: %@",ans);
    
}

+ (NSString*)getMedianForFirstArrays:(NSArray*)firstArray SecondArray:(NSArray*)secondArray{
    
    NSArray* sortedArray = [MedianInArrays mergeSortWitFirstArray:firstArray SecondArray:secondArray];
    
    NSInteger mid = sortedArray.count/2;
    NSString* ans = 0;
    if (sortedArray.count%2 == 0){
        // Even Case
        float num1 = [sortedArray[mid] floatValue];
        float num2 = [sortedArray[mid-1] floatValue];
        float median = (num1 + num2) / 2 ;
        ans = [NSString stringWithFormat:@"%f",median];
    }else{
        // Odd Case
        ans = sortedArray[mid];
    }

    return ans;
}

+ (NSArray*)mergeSortWitFirstArray:(NSArray*)firstArray SecondArray:(NSArray*)secondArray {
    NSMutableArray* finalArray = [NSMutableArray array];
    
    NSInteger firstPivot = 0; // Keeps track of first Array Index
    NSInteger secondPivot = 0; // Keeps track of second Array Index
    
    while (firstPivot < firstArray.count && secondPivot < secondArray.count) {
        
        if ([firstArray[firstPivot] integerValue] < [secondArray[secondPivot] integerValue]){
            [finalArray addObject:firstArray[firstPivot++]];
        }else{
            [finalArray addObject:secondArray[secondPivot++]];
        }
    }
    
    // Remaining Values:
    NSArray* subArray;
    if (firstPivot < firstArray.count)
        subArray = [firstArray subarrayWithRange:NSMakeRange(firstPivot, firstArray.count - firstPivot)];
    else
        subArray = [secondArray subarrayWithRange:NSMakeRange(secondPivot, secondArray.count - secondPivot)];
    [finalArray addObjectsFromArray:subArray];
    return [finalArray copy];
}

@end
