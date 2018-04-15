//
//  Stack.h
//  CodingProblem
//
//  Created by Kanwar Zorawar Singh Rana on 4/15/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

- (void)push:(id)value;
- (id)pop;
- (id)top;
- (BOOL)isEmpty;
@end
