//
//  MergeSortedLists.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/14/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "MergeSortedLists.h"
#import "LinkedList.h"

@implementation MergeSortedLists

+ (void)runMergeSortedLists{
    
    LinkedList* list1 = [MergeSortedLists createSortedList:[NSArray arrayWithObjects:@"1",@"3",@"5",@"6",@"9", nil]];
    LinkedList* list2 = [MergeSortedLists createSortedList:[NSArray arrayWithObjects:@"2",@"4",@"6",@"7",@"8", nil]];
    LinkedList* mergedList = [MergeSortedLists mergeSortedLists1:list2 AndList2:list1];
    [MergeSortedLists displayMergedList:mergedList];
}

+ (void)displayMergedList:(LinkedList*)list{
    LinkedList* head = list;
    while (head) {
        NSLog(@"%@",head.value);
        head = head.node;
    }
}

+(LinkedList*)mergeSortedLists1:(LinkedList*)list1 AndList2:(LinkedList*)list2{
    
    __block LinkedList* root;
    LinkedList* head1 = list1;
    LinkedList* lPtr1 = list1;
    LinkedList* head2 = list2;
    LinkedList* lPtr2 = list2;
    
    while (head1 || head2) {
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            root =([head1.value integerValue] < [head2.value integerValue])?
            head1 : head2;
        });
        
        if(!head1){
            lPtr1.node = head2;
            head2 = nil;
        }else if (!head2){
            lPtr2.node = head1;
            head1 = nil;
        }
        else if([head1.value intValue] < [head2.value intValue]){
            lPtr1 = head1;
            head1 = head1.node;
            if ([lPtr2.value intValue] < [lPtr1.value intValue] &&
                [lPtr1.value intValue] < [head2.value intValue]){
                lPtr2.node = lPtr1;
                lPtr2 = head2;
            }

        }else if([head1.value intValue] > [head2.value intValue]){
            lPtr2 = head2;
            head2 = head2.node;
            if ([lPtr1.value intValue] < [lPtr2.value intValue] &&
                [lPtr2.value intValue] < [head1.value intValue]){
                lPtr1.node = lPtr2;
                lPtr1 = head1;
            }
        }else{
            if (lPtr2 == head2){
                lPtr1 = head1;
                head1 = head1.node;
                lPtr1.node = lPtr2;
                head2 = head2.node;
                lPtr1 = head1; // IMP Edge Case
            }else{
                lPtr2 = head2;
                head2 = head2.node;
                lPtr2.node = lPtr1;
                head1 = head1.node;
                lPtr2 = head2; // IMP Edge Case
            }
        }
    }
    return root;
}

+(LinkedList*)createSortedList:(NSArray*)listAr{
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


@end
