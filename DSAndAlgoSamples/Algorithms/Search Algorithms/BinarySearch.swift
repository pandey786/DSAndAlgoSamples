//
//  BinarySearch.swift
//  DSAndAlgoSamples
//
//  Created by Durgesh Pandey on 15/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation

extension SearchAlgorithms {
    
    //Recursive Way
    /*
     static func binarySearch<T: Comparable>(_ a: [T], _ key: T, _ range: Range<Int>) -> Int? {
     
     if range.lowerBound >= range.upperBound {
     
     //Search key is Not Present
     return nil
     } else {
     
     //get Mid Range
     let midIndex = range.lowerBound + ((range.upperBound - range.lowerBound) / 2)
     
     if a[midIndex] > key {
     
     //search key is in left half
     return binarySearch(a, key, range.lowerBound..<midIndex)
     } else if a[midIndex] < key  {
     
     //search key is in right half
     return binarySearch(a, key, midIndex + 1..<range.upperBound)
     } else {
     
     //We found Key
     return midIndex
     }
     }
     } */
    
    //Iterative Way
    static func binarySearch<T: Comparable>(_ a: [T], _ key: T) -> Int? {
        
        var lowerBound = 0
        var upperBound = a.count
        
        while lowerBound < upperBound {
            
            let midIndex = lowerBound + ((upperBound - lowerBound) / 2)
            
            if a[midIndex] < key {
                
                //search key is in right half
                lowerBound = midIndex + 1
            } else if a[midIndex] < key  {
                
                //search key is in left half
                upperBound = midIndex
            } else {
                
                //We found Key
                return midIndex
            }
        }
        
        return nil
    }
    
    /*
     For an array of size n, the performance is not O(n) as with linear search but only O(log n). To put that in perspective, binary search on an array with 1,000,000 elements only takes about 20 steps to find what you're looking for, because log_2(1,000,000) = 19.9. And for an array with a billion elements it only takes 30 steps. (Then again, when was the last time you used an array with a billion items?)
     
     Sounds great, but there is a downside to using binary search: the array must be sorted. In practice, this usually isn't a problem.
     
     Here's how binary search works:
     
     Split the array in half and determine whether the thing you're looking for, known as the search key, is in the left half or in the right half.
     How do you determine in which half the search key is? This is why you sorted the array first, so you can do a simple < or > comparison.
     If the search key is in the left half, you repeat the process there: split the left half into two even smaller pieces and look in which piece the search key must lie. (Likewise for when it's the right half.)
     This repeats until the search key is found. If the array cannot be split up any further, you must regrettably conclude that the search key is not present in the array.
     Now you know why it's called a "binary" search: in every step it splits the array into two halves. This process of divide-and-conquer is what allows it to quickly narrow down where the search key must be
     */
}
