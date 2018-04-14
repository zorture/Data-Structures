//
//  ReverseList.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/14/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "ReverseList.h"
#import "LinkedList.h"

LinkedList* rootList;
@implementation ReverseList

+ (void)runReverseList{
    
    LinkedList* list = [LinkedList createList:[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil]];
    [LinkedList displayMergedList:list];
    [ReverseList reverseList:list];
    [LinkedList displayMergedList:rootList];
}

+ (void)reverseList:(LinkedList*)list{
    
    if(!list){
        return;
    }
    [ReverseList reverseList:list.node];
    if (!list.node){
        rootList = list;
    }else{
        LinkedList* prevList = list.node;
        prevList.node = list;
        list.node = nil;
    }
}


@end
