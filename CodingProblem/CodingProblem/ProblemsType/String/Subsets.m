//
//  Subsets.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/18/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "Subsets.h"

@interface Subsets()
@property(nonatomic,strong)NSMutableArray* solutionAr;
@end

@implementation Subsets

+(void)runProblem{
    [[[Subsets alloc] init] findSolution];
}

- (instancetype)init{
    return [super init];
}

- (void)findSolution{
    self.solutionAr = [NSMutableArray array];
    NSArray* inputAr = @[@"1",@"2",@"3"];
    [self printTheSubsets:inputAr];

    NSLog(@"%@",self.solutionAr.debugDescription);
}

- (void)printTheSubsets:(NSArray*)inputAr{
    NSInteger n = inputAr.count;
    
    // Run a loop for printing all 2^n
    // subsets one by obe
    for (int i = 0; i < (1<<n); i++)
    {
        NSMutableArray* a = [NSMutableArray array];
        NSLog(@"{");
        // Print current subset
        for (int j = 0; j < n; j++){
            
            // (1<<j) is a number with jth bit 1
            // so when we 'and' them with the
            // subset number we get which numbers
            // are present in the subset and which
            // are not
            int res = (i & (1 << j));
            if (res > 0){
                NSLog(@"%@ ",inputAr[j]);
                [a addObject:inputAr[j]];
            }
        }
        [self.solutionAr addObject:a];
        NSLog(@"}");
        
    }
}


@end
