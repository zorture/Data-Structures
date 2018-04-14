//
//  LinkedList.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/14/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "LinkedList.h"

@implementation LinkedList

+(LinkedList*)createList:(NSArray*)listAr{
    LinkedList* rootNode;
    LinkedList* parentNode;
    for (int i = 0; i< listAr.count; i++){
        LinkedList* list = [LinkedList new];
        list.value = listAr[i];
        if (i == 0){
            rootNode = list;
        }
        if(parentNode)
            parentNode.node = list;
        parentNode = list;
        
    }
    return rootNode;
}

+ (void)displayMergedList:(LinkedList*)list{
    LinkedList* head = list;
    while (head) {
        NSLog(@"%@",head.value);
        head = head.node;
    }
}

@end
