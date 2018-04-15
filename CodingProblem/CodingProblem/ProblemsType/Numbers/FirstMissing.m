//
//  FirstMissing.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/15/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "FirstMissing.h"


static FirstMissing* sharedFirstMissing;

@interface FirstMissing()
@property(nonatomic,strong)NSArray* inputAr;
@end
@implementation FirstMissing

+ (void)runFirstMissing{
    sharedFirstMissing = [[FirstMissing alloc] init];
    [sharedFirstMissing findSolution];
}

- (instancetype)init{
    self = [super init];
    return self;
}

- (void)findSolution{
    //self.inputAr = [NSArray arrayWithObjects:@0,@1,@2,@4,@5,@6, nil];
    
    self.inputAr = [NSArray arrayWithObjects:@0,@1,@8,@2,@9,@6, nil];
    self.inputAr = [self.inputAr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    NSInteger missingNo = [self findFirstMissing:self.inputAr Start:0 End:self.inputAr.count-1];
    NSLog(@"%ld",missingNo);
}

- (NSInteger)findFirstMissing:(NSArray*)inputAr Start:(NSInteger)start End:(NSInteger)end{
    
    if (start > end){
        return end+1;
    }
    if (start != [inputAr[start] integerValue]){
        return start;
    }
    
    NSInteger mid = start+end /2;
    
    if ([inputAr[mid] integerValue] == mid){
        return [self findFirstMissing:inputAr Start:mid+1 End:end];
    }
    
    return [self findFirstMissing:inputAr Start:start End:mid];
}

@end
