//  Created by Kanwar Zorawar Singh Rana on 12/18/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.


var array = [95,22,90,30,70,20,55,80]

print(array)

func bubbleSort(withArray array:[Int]) -> [Int]{
    
    var array = array
    var count = array.count-2
    for _ in 0...array.count - 2 {
        for index in 0...count {
            if array[index] > array[index+1]{
                array.swapAt(index, index+1)
            }
        }
        count -= 1
    }
    return array
}

print(bubbleSort(withArray: array))
