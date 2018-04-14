//
//  Trie.h
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/13/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trie : NSObject
@property(nonatomic,strong) NSString* value;
@property(nonatomic,assign) NSInteger height;
@property(nonatomic,strong) NSMutableDictionary<NSString*,Trie*>* nodes;
@end
