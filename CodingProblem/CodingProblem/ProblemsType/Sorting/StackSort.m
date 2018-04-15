//
//  StackSort.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/15/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "StackSort.h"
#import "Stack.h"

static StackSort* sharedStackSort;

@interface StackSort()
@property(nonatomic,strong)NSArray* inputAr;
@property(nonatomic,strong)Stack* stack;
@end

@implementation StackSort

+ (void)runStackSort{
    sharedStackSort = [[StackSort alloc] init];
    [sharedStackSort findSolution];
}

- (instancetype)init{
    self = [super init];
    return self;
}

- (void)findSolution{
    self.inputAr = [NSArray arrayWithObjects:@10,@20,@30,@40, nil];
    self.stack = [self insertIntoStack:self.inputAr];
    [self sortStack:self.stack];
    NSLog(@"%@",self.stack.description);
    
}

- (Stack*)insertIntoStack:(NSArray*)values{
    Stack* stack = [[Stack alloc] init];
    for (int i=0; i<values.count; i++){
        [stack push:values[i]];
    }
    return stack;
}

- (void)sortStack:(Stack*)stack{
    if(!stack.isEmpty){
        NSNumber* tempVar = [stack pop];
        
        // Recurse till end and store the variable.
        [self sortStack:stack];
        
        // Now sort one by one
        [self sortedInsert:stack Element:tempVar];
    }
    
}

- (void)sortedInsert:(Stack*)stack Element:(id)element{
    
    if (stack.isEmpty || element < stack.top){
        [stack push:element];
        return;
    }
    
    NSNumber* tempVar = [stack pop];
    // Next Two linkes essentially swaps
    [self sortedInsert:stack Element:element];
    [stack push:tempVar];
}

@end
