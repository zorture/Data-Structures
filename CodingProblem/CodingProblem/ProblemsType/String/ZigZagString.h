//
//  ZigZagString.h
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/13/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

/*  Problem Statement
 
Given a string and number of rows ‘n’. Print the string formed by concatenating n rows when input string is written in row-wise Zig-Zag fashion
 
 Input: str = "ABCDEFGH"
 n = 2
 Output: "ACEGBDFH"
 Explanation: Let us write input string in Zig-Zag fashion
 in 2 rows.
 A   C   E   G
 B   D   F   H
 Now concatenate the two rows and ignore spaces
 in every row. We get "ACEGBDFH"
 
 */

#import <Foundation/Foundation.h>
#import "AppRunner.h"

@interface ZigZagString : NSObject
+ (void)runZigZagString;
@end
