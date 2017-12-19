//  Created by Kanwar Zorawar Singh Rana on 12/18/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.


var array = [95,22,90,30,70,20,55,80,10,5,2]


func mergeArray(leftArray: [Int], rightArray: [Int])-> [Int]{

    var mainArray = [Int]()
    
    var ltPvt = 0
    var rtPvt = 0
    
    while ltPvt < leftArray.count && rtPvt < rightArray.count {
        if leftArray[ltPvt] < rightArray[rtPvt] {
            mainArray.append(leftArray[ltPvt])
            ltPvt += 1
        }else {
            mainArray.append(rightArray[rtPvt])
            rtPvt += 1
        }
    }
    
    while ltPvt < leftArray.count {
        mainArray.append(leftArray[ltPvt])
        ltPvt += 1
    }
    
    while rtPvt < rightArray.count {
        mainArray.append(rightArray[rtPvt])
        rtPvt += 1
    }
    return mainArray
}

func mergeSort(withArray array:[Int]) -> [Int]{
    
    //print(array)
    if(array.count < 2){
        return array
    }
    let mid = array.count/2
    //print(mid)
    
    var leftArray = [Int]()
    var rightArray = [Int]()
    
    for i in 0...mid-1{
        leftArray.append(array[i])
    }
    
    for i in mid...array.count-1{
        rightArray.append(array[i])
    }

    let mergedArray = mergeArray(leftArray: mergeSort(withArray: leftArray), rightArray: mergeSort(withArray: rightArray))
    return mergedArray
}

print(mergeSort(withArray: array))
