//
//  Duplicates.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/15/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "Duplicates.h"

static Duplicates* sharedDuplicates;

@interface Duplicates()
@property(nonatomic,strong)NSMutableArray* inputAr;
@end
@implementation Duplicates

+ (void)runDuplicates{
    sharedDuplicates = [[Duplicates alloc] init];
    [sharedDuplicates findSolution];
}

- (instancetype)init{
    self = [super init];
    return self;
}

- (void)findSolution{
    self.inputAr = [NSMutableArray arrayWithObjects:@1,@3,@3,@1, nil];
    [self findRepeatingForN:self.inputAr];
}

- (void) findRepeatingForN:(NSMutableArray*)inputAr{

    printf("The repeating elements are: \n");
    for (int i = 0; i < inputAr.count; i++)
    {
        int absVal = abs([inputAr[i] intValue]);
        if ([inputAr[absVal] intValue] >= 0){
            int newValue = [inputAr[absVal] intValue] * -1 ;
            inputAr[absVal] = [NSNumber numberWithInt:newValue];
        }
        else{
            NSLog(@"%d",abs([inputAr[i] intValue]));
        }
    }
}

@end
