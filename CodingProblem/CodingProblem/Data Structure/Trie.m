//
//  Trie.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/13/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "Trie.h"

@implementation Trie

- (instancetype)init{
    self = [super init];
    if (self){
        self.nodes = [NSMutableDictionary dictionary];
    }
    return self;
}
@end
