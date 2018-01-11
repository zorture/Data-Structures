
//  Matrix Rotation Problem
//
//  Created by Kanwar Zorawar Singh Rana on 12/28/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.
//

let row = 3
let col = 3
var arr = Array(repeating: Array(repeating: 0, count: col), count: row)

var counter = 1
for i in 0..<row{
    for j in 0..<col{
        arr[i][j] = counter
        counter += 1
    }
}

for i in 0..<row{
    for j in 0..<col{
        if j == col - 1 {
            print(arr[i][j], separator: "", terminator: "\n")
        }
        else {
            print(arr[i][j], separator: "", terminator: "")
        }
    }
}

print("\nRotation Anti Clockwise\n")

for i in (0..<row).reversed(){
    for j in 0..<col{
        if j == col - 1 {
            print(arr[j][i], separator: "", terminator: "\n")
        }else{
            print(arr[j][i], separator: "", terminator: "")
        }
    }
}

print("\nRotation Clockwise\n")

for i in 0..<row{
    for j in (0..<col).reversed(){
        if j == 0 {
            print(arr[j][i], separator: "", terminator: "\n")
        }else{
            print(arr[j][i], separator: "", terminator: "")
        }
    }
}





