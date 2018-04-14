//
//  PhoneNumberLetter.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/13/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "PhoneNumberLetter.h"

NSMutableArray* ar;
@implementation PhoneNumberLetter
int loop = 0;


+ (void)runPhoneNumberLetter{
    ar = [NSMutableArray new];
    [PhoneNumberLetter getAllCombinationForNumber:23];
    
}

+(void)getAllCombinationForNumber:(NSInteger)number{
    Trie* node = [PhoneNumberLetter createBSTForNumber:number];
    [PhoneNumberLetter preOrderTracerse:node];

}

+(void)preOrderTracerse:(Trie*)node{
    
    /*
    Trie* headNode = node;
    while (headNode) {
        [ar addObject:headNode.value];
        NSString* key = [headNode.nodes allKeys].firstObject;
        Trie* newNode = headNode.nodes[key];
        headNode = newNode;
    }
*/
    
    
    
    /*
    
    if(node.nodes.count<0){
        [ar addObject:node.value];
        return;
    }
    NSLog(@"%@",node.value);
 
    
    for (NSString* nodeKey in node.nodes){
        Trie* newNode = [node.nodes objectForKey:nodeKey];
        [PhoneNumberLetter preOrderTracerse:newNode];
    }
    */
}

+ (Trie*)createBSTForNumber:(NSInteger)number{
    
    NSDictionary* mapKey = [PhoneNumberLetter numberToLetterDict];
    
    Trie* rootNode = [Trie new];
    rootNode.value = @"";
    rootNode.height = 0;
    
    
    Trie* headNod = rootNode;
    for (int i=2; i<4; i++){
        
        NSNumber* object = [NSNumber numberWithInt:i];
        NSArray* allKeys = [mapKey objectForKey:object];

        if(headNod.nodes.count<1)
            [PhoneNumberLetter createSubNodesWithKeys:allKeys ForRoot:headNod];
        else{
            for (NSString* nodeKey in headNod.nodes){
                Trie* node = [headNod.nodes objectForKey:nodeKey];
                [PhoneNumberLetter createSubNodesWithKeys:allKeys ForRoot:node];
            }
        }
    }
    NSLog(@"%d",loop);
    return rootNode;
}

+ (void)createSubNodesWithKeys:(NSArray*)keys ForRoot:(Trie*)headNode{
    for (NSString* key in keys){
        Trie* node = [Trie new];
        node.value = key;
        //node.height = headNode.height+1;
        [headNode.nodes setObject:node forKey:key];
        loop++;
    }
    //return headNode;
}

+ (NSDictionary*)numberToLetterDict{
    
    NSDictionary *dict = @{@2: @[@"A", @"B", @"C"],
                           @3: @[@"D", @"E", @"F"],
                           @4: @[@"G", @"H", @"I"],
                           @5: @[@"J", @"K", @"L"],
                           @6: @[@"M", @"N", @"O"],
                           @7: @[@"P", @"Q", @"R", @"S"],
                           @8: @[@"T", @"U", @"V"],
                           @9: @[@"W", @"X", @"Y", @"Z"]};
    
    return dict;
}

@end
