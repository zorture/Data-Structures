//
//  CombinationSum.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/14/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "CombinationSum.h"

static CombinationSum* sharedCombSum;

@interface CombinationSum()
@property(nonatomic,strong)NSArray* inputAr;
@property(nonatomic,strong)NSMutableArray* solutionAr;
@property(nonatomic,strong)NSMutableArray* caseAr;
@property(nonatomic,assign)NSInteger target;

@end

@implementation CombinationSum

+ (void)runCombinationSum{
    sharedCombSum = [[CombinationSum alloc] init];
    [sharedCombSum findSolution];
}

- (instancetype)init{
    self = [super init];
    return self;
}

-(void)findSolution{
    self.inputAr = [NSArray arrayWithObjects:@2,@4,@6,@8, nil];
    self.target = 8;
    self.solutionAr = [NSMutableArray array];
    self.caseAr = [NSMutableArray array];
    [self findResultForSum:0 Index:0 Remain:self.target];
    NSLog(@"%@",self.solutionAr);
}

- (void)findResultForSum:(NSInteger)sum Index:(NSInteger)index Remain:(NSInteger)remain{
    
    if (sum>self.target){
        NSNumber* value = self.caseAr.lastObject;
        sum -= [value integerValue];
        [self.caseAr removeLastObject];
        return;
    }else if (sum== self.target){
        NSNumber* value = self.caseAr.lastObject;
        sum -= [value integerValue];
        [self.solutionAr addObject:[self.caseAr copy]];
        [self.caseAr removeLastObject];
    }
    while (remain>0) {
        NSNumber* value = self.inputAr[index];
        sum += [value integerValue];
        remain -= [value integerValue];
        [self.caseAr addObject:value];
        [self findResultForSum:sum Index:index Remain:remain];
        index = index+1;
    }
}


@end
