//  Subsers
//
//  Created by Kanwar Zorawar Singh Rana on 12/29/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.
//
import UIKit

func subsets(array: [Character])->[String] {
    
    //var newAr = [Character]()
    let len = array.count
    for i in 0..<(1<<len) {
        //print("{", separator: "", terminator: "")
        for j in 0..<len {
            if ((i & (i << j)) > 0) {
                print(array[j], separator: " ", terminator: "")
                //newAr.append(array[j])
            }
            else{
                print("", separator: "", terminator: "\n")
            }
            //print("}", separator: "", terminator: "")
        }
    }
    
    
    return [""]
}

func subsets1(array: [Character])->[String] {
    
    //var newAr = [Character]()
    //let len = array.count
    for i in 0..<8 {
        for j in 0..<3 {
            if(i & (i<<j)){
                print(array[j])
            }
            
        }
        
    }
    
    
    return [""]
}

let a = subsets1(array: ["a","b","c"])
print(a)

