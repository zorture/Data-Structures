//
//  HeapSort.swift
//  Sorting Algorithms
//
//  Created by Kanwar Zorawar Singh Rana on 6/10/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

/*     Summary
 Complexity:
 max_heapify O(logn)
 build_maxheap O(n)
 run max_heapify n-1 times
 
 Average Case: O(nlogn)

 */

import Foundation

class HeapSort  {
    
    class func runDemo() {
        var array = [95,22,90,30,70,20,55,80,10,5,2]

        let thisTime = Date()
        let object = HeapSort()
        print("unsorted array:" + array.debugDescription)
        object.heapSort(array: &array)
        let elapsed = Date().timeIntervalSince(thisTime)
        print("Heap Sort: " + array.debugDescription + " Time ::" + elapsed.debugDescription)

    }
    

    func heapify(array: inout [Int], index: Int, size: Int)
    {
        var largest = index;  // Initialize largest as root
        let left = 2*index + 1; // Left child
        let right = 2*index + 2; // Right child
        
        // If left child is larger than root
        if (left < size && array[left] > array[largest]){
            largest = left
        }
        
        // If right child is larger than largest so far
        if (right < size && array[right] > array[largest]){
            largest = right;
        }
        
        // If largest is not root
        if (largest != index)
        {
            array.swapAt(index, largest)

            // Recursively heapify the affected sub-tree
            heapify(array: &array, index: largest, size: size)
        }
    }
    
    func heapSort(array: inout [Int]) {

        let n = array.count
        for i in (0...n/2 - 1).reversed(){
            // Creates Max Heap
            heapify(array: &array, index: i, size: n)
        }
        
        for i in (0...n-1).reversed(){
            // Swaps first and last, sort in every pass.
            array.swapAt(0, i)
            
            // max heapify on the reduced heap
            heapify(array: &array, index: 0, size: i)
        }
    }
}
