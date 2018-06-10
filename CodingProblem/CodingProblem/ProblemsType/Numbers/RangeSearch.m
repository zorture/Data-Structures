//
//  RangeSearch.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/18/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "RangeSearch.h"

@interface RangeSearch()
@property(nonatomic,strong)NSArray* inputAr;
@property(nonatomic,assign)NSInteger target;
@property(nonatomic,strong)NSMutableArray* solutionAr;
@end

@implementation RangeSearch

+ (void)runProblem{
    [[[RangeSearch alloc] init] findSolution];
}

- (instancetype)init{
    return [super init];
}

- (void)findSolution{
    
    self.inputAr = @[@1,@2,@5,@5,@5,@8,@9];
    self.target = 5;
    self.solutionAr = [NSMutableArray array];
    [self searchforRangeFromRange:0 ToRange:self.inputAr.count];
    
    NSLog(@"%@",self.solutionAr.debugDescription);
}

- (void)get{
    
}

- (void)searchforRangeFromRange:(NSInteger)min ToRange:(NSInteger)max{
    
//    if (min == max)
//        return;
    
    NSInteger midIndex = (min+max)/2;
    NSInteger middle = [self.inputAr[midIndex] integerValue];
    
    if (self.target < middle){
            [self searchforRangeFromRange:min ToRange:midIndex];
    }
    else if (self.target> middle){
            [self searchforRangeFromRange:midIndex+1 ToRange:max];
    }
    else{
        if (min == max && max < self.inputAr.count){
            [self.solutionAr addObject:[NSNumber numberWithInteger:min]];
            return;
        }else
            [self searchforRangeFromRange:min ToRange:midIndex];
        
        if (midIndex == max ){
            [self.solutionAr addObject:[NSNumber numberWithInteger:min]];
            return;
        }
        else
            [self searchforRangeFromRange:midIndex ToRange:max];
    }

}


/*
 BOOL leftDone = false;
 BOOL rightDone = false;
 NSInteger left = midIndex;
 NSInteger righ = midIndex;
 while (!leftDone || !rightDone) {
 if ([self.inputAr[--left] integerValue] != self.target  && !leftDone) {
 leftDone = true;
 [self.solutionAr addObject:[NSNumber numberWithInteger:++left]];
 }
 if ([self.inputAr[++righ] integerValue] != self.target && !rightDone) {
 rightDone = true;
 [self.solutionAr addObject:[NSNumber numberWithInteger:--righ]];
 }
 }
 */
@end
