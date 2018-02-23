//
//  InsertionSort.swift
//  DSAndAlgoSamples
//
//  Created by Durgesh Pandey on 14/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation

extension SortingAlgorithms {
    
    //Optimized Insertion Sort
    static func insertionSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
        var a = array
        for x in 1..<a.count {
            var y = x
            let temp = a[y]
            while y > 0 && isOrderedBefore(temp, a[y - 1]) {
                a[y] = a[y - 1]
                y -= 1
            }
            a[y] = temp
        }
        return a
    }
    
    /*
     //Simple Insertion Sort
     static func insertionSort(_ array: [Int]) -> [Int] {
     var a = array             // 1
     for x in 1..<a.count {         // 2
     var y = x
     while y > 0 && a[y] < a[y - 1] { // 3
     a.swapAt(y - 1, y)
     y -= 1
     }
     }
     return a
     }
     
     /*
     Here is how the code works.
     
     Make a copy of the array. This is necessary because we cannot modify the contents of the array parameter directly. Like Swift's own sort(), the insertionSort() function will return a sorted copy of the original array.
     
     There are two loops inside this function. The outer loop looks at each of the elements in the array in turn; this is what picks the top-most number from the pile. The variable x is the index of where the sorted portion ends and the pile begins (the position of the | bar). Remember, at any given moment the beginning of the array -- from index 0 up to x -- is always sorted. The rest, from index x until the last element, is the unsorted pile.
     
     The inner loop looks at the element at position x. This is the number at the top of the pile, and it may be smaller than any of the previous elements. The inner loop steps backwards through the sorted array; every time it finds a previous number that is larger, it swaps them. When the inner loop completes, the beginning of the array is sorted again, and the sorted portion has grown by one element.
     
     */
     */
    
}
