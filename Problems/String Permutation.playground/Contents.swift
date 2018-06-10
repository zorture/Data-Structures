//  Created by Kanwar Zorawar Singh Rana on 12/18/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.

func stringPermutation(charAr: [Character], countAr: [Int], result: [Character], level: Int){
    
    var result = result
    var countAr = countAr
    if level == charAr.count{
        
        let result = result.reduce("") {char1, char2 in "\(char1)\(char2)"}
        print("\(result)")
        return
    }
    
    
    for i in 0..<charAr.count{
        if countAr[i] == 0{
            continue
        }
        
        result.append(charAr[i])
        countAr[i] -= 1
        stringPermutation(charAr: charAr, countAr: countAr, result: result, level: level + 1)
        countAr[i] += 1
        result.removeLast()
    }
    
}

let string = "123"

let charArray = Array(string)
let dict = [Character: Int]()

let charDict = charArray.reduce(into: [:]) { counts, word in
    counts[word, default: 0] += 1
}

let charAr = Array(charDict.keys)
let countAr = Array(charDict.values)

let result = [Character]()

stringPermutation(charAr: charAr, countAr: countAr, result: result, level: 0)

