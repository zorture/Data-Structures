//
//  QuickSort.swift
//  Sorting Algorithms
//
//  Created by Kanwar Zorawar Singh Rana on 6/10/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

/*    Summary
 Time complexity
 Average Case: O(nLogn)
 Worst Case: O(n^2)
 In-Space sorting algoritym
*/

import Foundation

class QuickSort {
    
    class func runDemo() {
        //var array = [95,22,90,30,70,20,55,80,10,5,2]
        var array = [2,5,3,4]
        let thisTime = Date()
        
        let object = QuickSort()
        print("unsorted array:" + array.debugDescription)
        object.quickSort(withArray: &array, startIndex: 0, endIndex: array.count-1)
        let elapsed = Date().timeIntervalSince(thisTime)
        print("Quick Sort: " + array.debugDescription + " Time ::" + elapsed.debugDescription)
    }
    

    func quickSort(withArray array: inout [Int], startIndex start: Int, endIndex end: Int){
        if (start >=  end){
            return
        }
        
        /*
        let pIndex = LomutoPartition(withArray: &array, startIndex: start, endIndex: end)
        quickSort(withArray: &array, startIndex: start, endIndex: pIndex-1)
        quickSort(withArray: &array, startIndex: pIndex+1, endIndex: end)
 */
        
        let pIndex = HoarePartition(withArray: &array, startIndex: start, endIndex: end)
        
        quickSort(withArray: &array, startIndex: start, endIndex: pIndex)
        quickSort(withArray: &array, startIndex: pIndex+1, endIndex: end)
        
    }
    
    func LomutoPartition(withArray array: inout [Int], startIndex start: Int, endIndex end: Int) -> Int{
        
        let pivot = array[end]
        var pIndex = start
        for i in start...end-1{
            if array[i] <= pivot{
                array.swapAt(i, pIndex)
                pIndex += 1
            }
        }
        array.swapAt(pIndex, end)        
        return pIndex
    }
    
    func HoarePartition(withArray array: inout [Int], startIndex start: Int, endIndex end: Int) -> Int{
        
        let pivot = array[start];
        var i = start - 1
        var j = end + 1;
        
        while true{
            repeat{ i += 1 } while (array[i] < pivot);
            repeat{ j -= 1 } while (array[j] > pivot);
            
            if i < j{
                 array.swapAt(i, j)
            }else{
                return j
            }
        }
    }
    

}
