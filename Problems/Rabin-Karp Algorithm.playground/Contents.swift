
//  Rabin-Karp Substring
//
//  Created by Kanwar Zorawar Singh Rana on 12/19/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.
//

import Foundation
import Darwin

extension String {
    func getHas() -> Int {
        
        // algo depends on Hash Function.
        // assuming no collision. 
        return customHash()
        // Default ios hash function.
        //return self.hashValue
        
    }
    
    func customHash()-> Int{
        
        let charAr = Array(self)
        var hash = 0
        
        for i in 0..<charAr.count{
            hash += charAr[i].asciiValue * primeValue(withPosition: i)
        }
        
        return hash
    }
    
    fileprivate func primeValue(withPosition position: Int)-> Int{
        let prime: Int = 19
        let value = Int(pow(Double(prime),Double(position)))
        return value == 0 ? 1 : value
    }
}

extension Character {
    var asciiValue: Int {
        get {
            let s = String(self).unicodeScalars
            return Int(s[s.startIndex].value)
        }
    }
}

func rabinkarpPattern(mainString: String, patternString: String)->Bool{
    

    let patternHash = patternString.getHas()
    
    var isOver = false
    var counter = 0
    while !isOver {
        
        let startIndex = mainString.index(mainString.startIndex, offsetBy: counter)
        let endIndex = mainString.index(mainString.startIndex, offsetBy: patternString.count + counter)

        let subString = mainString[startIndex ..< endIndex]
        let subStringHash = String(subString).getHas()
        
        print("\n Hash\n\(subStringHash)\n\(patternHash)")
        if (subStringHash == patternHash){
            print("Found string at index: \(counter)")
        }
        if (counter < mainString.count - patternString.count ){
            counter += 1
        }
        else{
            isOver = true
        }
        
    }
    
    return true
}

rabinkarpPattern(mainString: "GeeksOfGreekGeeks", patternString: "Geeks")

