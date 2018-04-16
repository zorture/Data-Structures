//
//  LongestWord.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/15/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "LongestWord.h"
#import "AppRunner.h"

static LongestWord* sharedLongestWord;

@interface LongestWord()
@property(nonatomic,strong)NSArray* inputAr;
@end

@implementation LongestWord

+ (void)runLongestWord{
    sharedLongestWord = [[LongestWord alloc] init];
    [sharedLongestWord findSolution];
}

- (instancetype)init{
    self = [super init];
    return self;
}

- (void)findSolution{
 
    NSString* word = [self longestWord];
    NSLog(@"%@",word);
}

- (NSString*)longestWord{
    NSArray* words = @[@"abc",@"baa",@"caanzb",@"an",@"bancc"];
    NSArray* chars = @[@"a",@"a",@"n",@"c",@"b"];
    NSMutableArray* charMAr = [chars mutableCopy];
    NSMutableSet* hashSet = [NSMutableSet set];
    
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"length"
                                                  ascending:NO];
    NSArray* sortedWrods = [words sortedArrayUsingDescriptors:@[sortDescriptor]];
    
    for (int i=0;i<chars.count;i++){
        NSString* hashStr = [[charMAr valueForKey:@"description"] componentsJoinedByString:@""];
        [charMAr removeLastObject];
        NSInteger hash = [self hashForString:hashStr];
        [hashSet addObject:[NSNumber numberWithInteger:hash]];
    }
    
    for (NSString* word in sortedWrods){
        NSInteger wordHash = [self hashForString:word];
        if([hashSet containsObject:[NSNumber numberWithInteger:wordHash]]){
            return word;
        }
    }
    return @"Not Found";
}

- (NSInteger)hashForString:(NSString*)string{
    NSInteger hashVal = 0;
    for (int i=0; i<string.length; i++){
        NSString* charAt = [AppRunner charAtIndex:i ForString:string];
        if([charAt isEqualToString:@"a"]){
            hashVal +=1;
        }
        else if([charAt isEqualToString:@"n"]){
            hashVal +=1;
        }
        else if([charAt isEqualToString:@"c"]){
            hashVal +=1;
        }
        else if([charAt isEqualToString:@"b"]){
            hashVal +=1;
        }else{
            return 0;
        }
        
    }
    return hashVal;
}


@end

