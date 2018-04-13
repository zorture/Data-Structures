//
//  Regex Pattern
//  Problems
//
//  Created by Kanwar Zorawar Singh Rana on 12/19/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.
//

func regexPatternMatch(string: String, pattern: String)-> Bool{
    
    let strLen = string.count
    let patLen = pattern.count
    
    let string = Array(string)
    let pattern = Array(pattern)
    
    if (patLen == 0){
        return false
    }
    
    // 2D lookup array
    var lookUp = Array(repeating: Array(repeating: false, count: patLen+1), count: strLen+1)
    
    // make empty true
    lookUp[0][0] = true
    
    // Only for * match
    for j in 1..<patLen {
        if pattern[j - 1] == "*"{
            lookUp[0][j] = lookUp[0][j - 1]
        }
    }
    
    for i in 1...strLen{
        for j in 1...patLen{
            
            if pattern[j-1] == "*"{
                lookUp[i][j] = lookUp[i][j-1] || lookUp[i-1][j]
            }
            else if (pattern[j-1] == "?") || (string[i-1] == pattern[j-1]) {
                lookUp[i][j] = lookUp[i-1][j-1]
            }
            else{
                lookUp[i][j] = false
            }
        }
    }
    
    return lookUp[strLen][patLen]
}

var val = regexPatternMatch(string: "baaabab", pattern: "*****ba*****ab")
print(val)

val = regexPatternMatch(string: "xayz", pattern: "x?y*z")
print(val)

val = regexPatternMatch(string: "xyz", pattern: "x?y*z")
print(val)
