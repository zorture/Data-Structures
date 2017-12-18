//  Created by Kanwar Zorawar Singh Rana on 12/18/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.


var array = [95,22,90,30,70,20,55,80]

print(array)

func selectionSort(withArray array:[Int]) -> [Int]{
    
    var array = array
    var newArray = [Int]()
    for _ in 0...array.count - 1 {
        var minNo:Int = 1000
        var minIndex=0
        for index in 0...array.count-1 {
            if array[index] < minNo {
                minNo = array[index]
                minIndex = index
            }
        }
        array.remove(at: minIndex)
        newArray.append(minNo)
    }
    
    return newArray
}

print(selectionSort(withArray: array))
