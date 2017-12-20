
//  KnapSack Problem
//
//  Created by Kanwar Zorawar Singh Rana on 12/20/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.
//

func knapSackBottomUp(value: [Int], weight: [Int], maxWeight: Int)->Int {
    
    let row = value.count+1
    let col = maxWeight+1
    var lookUp = Array(repeating: Array(repeating: 0, count: col), count: row)
    
    for i in 0..<row {
        for j in 0..<col {
            if (i == 0 || j == 0){
                lookUp[i][j] = 0
                continue
            }
            
            if (j - weight[i-1] >= 0){
                let a = lookUp[i-1][j]
                let b = lookUp[i-1][j-weight[i-1]] + value[i-1]
                lookUp[i][j] = max(a, b)
            }else{
                lookUp[i][j] = lookUp[i-1][j]
            }
        }
        
    }
    
    print("\n Bottom Up Matrix \n")
    for i in 0..<row{
        for j in 0..<col {
            
            if j == col - 1 {
                print("",lookUp[i][j], separator: " ", terminator: "\n")
            }else {
                print("",lookUp[i][j], separator: " ", terminator: "")
            }
        }
    }
    
    return lookUp[row-1][maxWeight]
    
}
print("\nMax Weight:: \(knapSackBottomUp(value: [1,4,5,7], weight: [1,3,4,5], maxWeight: 7))")

