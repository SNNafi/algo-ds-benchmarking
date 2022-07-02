//
//  InsertionSort.swift
//  
//
//  Created by Shahriar Nasim Nafi on 2/7/22.
//


public extension Array where Element: Comparable {
    func insertionSorted() -> [Element] {
        var sorted = self
        
        for i in 1..<sorted.count {
            let value = sorted[i]
            var j = i - 1
            while j >= 0 && sorted[j] > value {
                sorted[j + 1] = sorted[j]
                j-=1
            }
            sorted[j + 1] = value
        }
        
        return sorted
    }
    
    mutating func insertionSort() {
        for i in 1..<self.count {
            let value = self[i]
            var j = i - 1
            while j >= 0 && self[j] > value {
                self[j + 1] = self[j]
                j-=1
            }
            self[j + 1] = value
        }
    }
}
