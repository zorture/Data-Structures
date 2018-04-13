
//  KMP Substring
//
//  Created by Kanwar Zorawar Singh Rana on 12/19/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.
//

import Foundation


func patternArray(withCharArray charArray: [Character])-> [Int]{
    
    var posArr = [0]
    var i = 1
    var j = 0
    while (i < charArray.count) {
        
        if (charArray[j] == charArray[i]){
            posArr.append(j+1)
            i += 1
            j += 1
        }else{
            if(j != 0) {
                j = posArr[j-1]
            }else{
                posArr.append(0)
                i += 1
            }
        }
    }
    
    print(posArr)
    return posArr
}

func hasPattern(mainString: String, patternString: String)-> Bool{
    
    var text = Array(mainString)
    var pattern = Array(patternString)
    //var posArr = patternArray(withCharArray: Array(patternString))
    var posArr = [0]
    var i = 0
    var j = 0
    while (i < text.count && j < patternString.count) {
        
        if (text[i] == pattern[j]){
            posArr.append(j+1)
            i += 1
            j += 1
        }else{
            if(j != 0) {
                j = posArr[j-1]
            }else{
                posArr.append(0)
                i += 1
            }
        }
    }
    
    if (j == pattern.count){
        return true
    }
    
    return false
}

let value = hasPattern(mainString: "abcxabcdabcdabcy", patternString: "abcdabcy")

print(value)

