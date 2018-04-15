//
//  SortingData.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/15/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "SortingData.h"

static SortingData* sharedSortingData;

@interface SortingData()
@property(nonatomic,strong)NSArray* inputAr;
@end

@implementation SortingData

+ (void)runSortingData{
    sharedSortingData = [[SortingData alloc] init];
    [sharedSortingData findSolution];
}

- (instancetype)init{
    self = [super init];
    return self;
}

- (void)findSolution{
    
    [self sortListOfWrods];
    
}

- (void)sortListOfWrods{
    NSMutableDictionary *wordsCount = [[NSMutableDictionary alloc] init];
    NSArray *words = @[@"doe", @"john", @"doe",@"john", @"jane", @"doe",@"john",@"john",];
    for (NSString *s in words)
    {
        NSNumber *count = [wordsCount objectForKey:s];
        wordsCount[s] = [NSNumber numberWithInt: count ? [count intValue] + 1 : 1];
    }
    NSArray* sortedAr = [wordsCount keysSortedByValueUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    NSLog(@"%@ %@", sortedAr, wordsCount);
}
@end

