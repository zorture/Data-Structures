//
//  Fibonacci Dynamic
//  Problems
//
//  Created by Kanwar Zorawar Singh Rana on 12/19/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.
//


func fibBottomUp(number: Int)-> Int {
    
    var memAr = Array(repeating: 0, count: number+1)
    
    memAr[0] = 0
    memAr[1] = 1
    
    for i in 2...number {
        memAr[i] = memAr[i-1] + memAr[i-2]
    }
    
    return memAr[number]
}

let num = 9
print(fibBottomUp(number: num))

var lookUp = Array(repeating: 0, count: num+1)

func fibMemoization(number: Int)-> Int {
    
    if lookUp[number] == 0 {
        if number <= 1 {
            lookUp[number] = number
        }
        else {
            lookUp[number] = fibMemoization(number: number-1) + fibMemoization(number: number-2)
        }
    }
    
    return lookUp[number]
}

print((fibMemoization(number: num)))

