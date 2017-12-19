
//  Rabin-Karp Substring
//
//  Created by Kanwar Zorawar Singh Rana on 12/19/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.
//

import Foundation

extension String {
    func getHas() -> Int {
        // Default ios hash function.
        return self.hashValue
        //
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

