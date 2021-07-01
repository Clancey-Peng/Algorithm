//
//  QuikSort.swift
//  algorithm
//
//  Created by penggongxu on 2021/6/3.
//

import Foundation

public class Solution {
    class func findKth ( _ array: inout [Int],  _ n: Int,  _ k: Int) -> Int {
        self.quickSort(&array, from: 0, to: n - 1)
        return array[n - k]
    }
    
    class func quickSort(_ a: inout [Int], from low: Int, to high: Int) {
        if low >= high { return }
        
        let m = partition(&a, from: low, to: high)
        quickSort(&a, from: low, to: a.index(before: m))
        quickSort(&a, from: a.index(after: m), to: high)
    }
    
    class func partition(_ a: inout [Int], from low: Int, to high: Int) -> Int {
        let pivot = a[low]
        var j = low
        var i = a.index(after: low)
        while i <= high {
            if a[i] < pivot {
                a.formIndex(after: &j)
                a.swapAt(i, j)
            }
            a.formIndex(after: &i)
        }
        a.swapAt(low, j)
        return j
    }
}
