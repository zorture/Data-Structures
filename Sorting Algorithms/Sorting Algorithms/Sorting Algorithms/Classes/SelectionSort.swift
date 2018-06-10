//
//  SelectionSort.swift
//  Sorting Algorithms
//
//  Created by Kanwar Zorawar Singh Rana on 6/10/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

/*     Summary
 Time complexity: O(n^2)
 Space Complexity: O(1)
 */

import Foundation

class SelectionSort  {
    
    class func runDemo() {
        //let array = [95,22,90,30,70,20,55,80,10,5,2]
        let array = [3,2,1,4]
        
        let object = SelectionSort()
        print("unsorted array:" + array.debugDescription)
        print("Selection Sort: ", object.selectionSort(withArray: array).debugDescription)
    }
    
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
}
