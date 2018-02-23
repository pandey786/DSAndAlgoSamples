//
//  LinearSearch.swift
//  DSAndAlgoSamples
//
//  Created by Durgesh Pandey on 15/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation

extension SearchAlgorithms {
    
    static func linearSearch<T: Equatable>(_ a: [T], _ key: T) -> Int? {
    
        for index in 0..<a.count {
            if a[index] == key {
                return index
            }
        }
        
        return nil
    }
    
    /*
     With linear search, we iterate over all the objects in the array and compare each one to the object we're looking for. If the two objects are equal, we stop and return the current array index. If not, we continue to look for the next object as long as we have objects in the array.
     */
    
    /*
     Linear search runs at O(n). It compares the object we are looking for with each object in the array and so the time it takes is proportional to the array length. In the worst case, we need to look at all the elements in the array.
     */
}
