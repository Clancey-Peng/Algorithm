//
//  CustomArray.swift
//  algorithm
//
//  Created by penggongxu on 2021/3/25.
//
// 自定义数组

import Foundation

public struct CustomArray<T> {
    private var data: [T]
    private var capacity = 0
    private var count = 0
    
    init(defaultElement: T, capacity: Int) {
        data = [T](repeating: defaultElement, count: capacity)
        self.capacity = capacity
        self.count = capacity
    }
    
    
    /// 查找
    func find(at index: Int) -> T? {
        guard index >= 0, index < count else {
            return nil
        }
        return data[index]
    }
    
    /// 删除数据
    mutating func delete(at index: Int) -> Bool {
        guard index >= 0, index < count else {
            return false
        }
        for i in index ..< count - 1 {
            data[i] = data[i + 1]
        }
        count -= 1
        return true
    }
    
    /// 插入数据
    mutating func insert(value: T, at index: Int) -> Bool {
        guard index >= 0, index < count, count < capacity else {
            return false
        }
        for i in index ... count - 1 {
            data[i + 1] = data[i]
        }
        data[1] = value
        count += 1
        return true
    }
    
    /// 添加数据
    mutating func add(value: T) -> Bool {
        guard count < capacity else {
            return false
        }
        data[count] = value
        return true
    }
    
}



