//
//  SubsetSums.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/14/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "SubsetSums.h"

NSInteger target;
NSMutableArray* solutionAr;
NSMutableArray* caseAr;
NSMutableArray* inputAr;
@implementation SubsetSums

+ (void)runSubsetSums{
    
    inputAr = [[NSArray arrayWithObjects:@5,@10,@20,@15,@30,@15, nil] mutableCopy];
    target = 30;
    solutionAr = [NSMutableArray array];
    caseAr = [NSMutableArray array];
    
    [SubsetSums fetchAllCombination];
    
    
}

+(void)fetchAllCombination{
    
    NSInteger count = inputAr.count;
    for (NSInteger i=0; i<count; i++){
        [SubsetSums combinationsFor:0 Weight:0];
        [inputAr removeObjectAtIndex:0];
    }
    NSLog(@"%@",solutionAr.description);
}

+(NSInteger)combinationsFor:(NSInteger)index Weight:(NSInteger)weight{
   
    while (weight < target && index < inputAr.count) {
        NSInteger newWeight = [inputAr[index] integerValue];
        weight += newWeight;
        [caseAr addObject:[NSNumber numberWithInteger:newWeight]];
        weight = [SubsetSums combinationsFor:index+1 Weight:weight];
        if(weight > target){
            NSInteger lastWeight = [[caseAr lastObject] integerValue];
            weight -= lastWeight;
            [caseAr removeLastObject];
            index = index+1;
        }
        else if (caseAr.count>0 && weight == target){
            [solutionAr addObject:caseAr];
            caseAr = [NSMutableArray array];
        }
        else{
            caseAr = [NSMutableArray array];
            index = index+1;
        }
    }
        
    return weight;
}

@end
