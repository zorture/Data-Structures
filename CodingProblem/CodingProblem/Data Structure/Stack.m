//
//  Stack.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/15/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "Stack.h"

@interface Stack()
@property(nonatomic,strong)NSMutableArray* stackArray;
@end

@implementation Stack

- (instancetype)init{
    self = [super init];
    if (self){
        self.stackArray = [NSMutableArray array];
    }
    return self;
}

- (void)push:(id)value{
    [self.stackArray addObject:value];
}

- (id)pop{
    id value = [self top];
    [self.stackArray removeObjectAtIndex:0];
    return value;
}

- (id)top{
    return self.stackArray.firstObject;
}

- (BOOL)isEmpty{
    return self.stackArray.count==0? YES:NO;
}

@end
