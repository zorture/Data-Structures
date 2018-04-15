//
//  NQueenProblem.m
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/14/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import "NQueenProblem.h"

NSMutableArray* board;
NSInteger size;
@implementation NQueenProblem

+ (void)runNQueenProblem{
    
    [NQueenProblem solveQueenProblem];

}

+ (void)solveQueenProblem{
    
    size = 4;
    board = [NQueenProblem createBoardOfSize:size];
    
    if ( [NQueenProblem solveQueenForBoard:board AtCol:0] ){
        printf("Solution does not exist");
    }
    [NQueenProblem printSolutionForBoard:board];

}

+ (void) printSolutionForBoard:(NSMutableArray*)board{

    for (int i = 0; i < size; i++)
    {
        for (int j = 0; j < size; j++)
            NSLog(@"@%@", board[i][j]);
        NSLog(@"@\n");
    }
}

+ (BOOL)isSafeForBoard:(NSMutableArray*)board AtRow:(NSInteger)row AtCol:(NSInteger)col{
    
    NSInteger i, j;

    for (i = 0; i < col; i++)
        if ([board[row][i] isEqual:@1])
            return false;
    
    for (i=row, j=col; i>=0 && j>=0; i--, j--)
        if ([board[i][j] isEqual:@1])
            return false;
    
    for (i=row, j=col; j>=0 && i<size; i++, j--)
        if ([board[i][j] isEqual:@1])
            return false;
    
    return true;

}

+ (BOOL)solveQueenForBoard:(NSMutableArray*)board AtCol:(NSInteger)col{
    
    if (col >= size)
        return true;
    for (int i = 0; i < size; i++)
    {
        if ( [NQueenProblem isSafeForBoard:board AtRow:i AtCol:col] )
        {
            board[i][col] = @1;
            if ([NQueenProblem solveQueenForBoard:board AtCol:col+1])
                return true;
            board[i][col] = @0; // BACKTRACK
        }
    }

    return false;
}

+ (NSMutableArray*)createBoardOfSize:(NSInteger)size{
    
    NSMutableArray* board = [NSMutableArray arrayWithCapacity:size];
    for (int i=0; i<size; i++){
        NSMutableArray* subBoard = [NSMutableArray arrayWithCapacity:size];
        for (int j=0; j<size; j++){
            [subBoard addObject:@0];
        }
        [board addObject:subBoard];
    }
    
    return board;
}





@end
