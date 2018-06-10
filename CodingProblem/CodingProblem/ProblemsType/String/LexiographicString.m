//
//  LexiographicString.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/17/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "LexiographicString.h"

static LexiographicString* sharedLexiographicString;

@interface LexiographicString()
@property(nonatomic,strong)NSArray* inputAr;
@end

@implementation LexiographicString

+ (void)runLexiographicString{
    sharedLexiographicString = [[LexiographicString alloc] init];
    [sharedLexiographicString findSolution];
}

- (instancetype)init{
    self = [super init];
    return self;
}

- (void)findSolution{
    
    NSMutableOrderedSet* baseSet = [[NSMutableOrderedSet alloc] initWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z", nil];
    
    NSMutableOrderedSet* testSet = [[NSMutableOrderedSet alloc] initWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h", nil];
    
    [baseSet intersectOrderedSet:testSet];
    
    NSInteger baseHash = [baseSet hash];
    NSInteger testHash = [testSet hash];
    NSLog(@"%ld %ld",baseHash,testHash);
    
    if ([baseSet isEqual:testSet]){
        NSLog(@"Yes");
    }else{
        NSLog(@"No");
    }
    
    NSLog(@"dkj");

}

@end
