//
//  ViewController.swift
//  SwiftAdvance
//
//  Created by 易 on 11/13/19.
//  Copyright © 2019 易. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        iteratorUse()
    }

    
    func usedReduce() {
        let temp = [1, 3, 5, 7]
//        let result = temp.reduce(0) { (total, item) in
//            total + item
//        }

        let result = temp.reduce(0, +)
        print(result)
    }
    
    func usedReduce2() {
        let temp = "asdgqasdfasdfa"
        let xx = temp.reduce(into: [:]) { (result, charactor) in
            result[charactor, default: 0] += 1
        }
        print(xx)
    }
    
    func mapAndFlatMap() {
        let t1 = ["A", "B", "C", "D"]
        let t2 = [1, 2, 3, 4]
        let temp = t1.flatMap { string in
                    t2.map {
                        (string, "\($0)")
                   }
        }
        print(temp)
    }
    
    func compactMap() {
        let numbers = ["1", "2", "gour", "///5///", "5"]

        // 此时用flatMap会报警告，因为返回值是可选的， compactMap为之前flatMap的去空方法的重构方法名
        let mapResult = numbers.compactMap { (number) -> Int? in
            return Int(number)
        }
        print(mapResult)
    }
    
    func useForEach() {
        let t1 = ["A", "B", "C", "D"]
        t1.forEach { str in
            print(str)
            if str == "C" {
                return
            }
        }
    }
    
    func useSlice() {
        let t1 = ["A", "B", "C", "D"]
        let temp = t1[1...]
        let _ = Array(temp)
    }
    
    //MARK: Dictionary
    func mergeDict() {
        var dict1 = ["name": "Tom", "age": "3"]
        let dict2 = ["name": "Jerry", "age": "3", "sex": "man"]
        dict1.merge(dict2) { (t1, t2) -> String in
            return t1            
        }
        print(dict1)
        
        let temp = "helloworld".map { ($0, 1)}
        print(temp)
        print(Dictionary(temp, uniquingKeysWith: +))
    }
    
    //MARK: Set
    func subtracting() {
        let t1: Set = ["1", "2", "3", "4"]
        let t2: Set = ["2", "5"]
        let t3 = t2.subtracting(t1) // ["5"]
        //let t4 = t1.subtracting(t2) // ["1", "3", "4"]
        print(t3)
    }
    
    func intersection() {
        let t1: Set = ["1", "2", "3", "4"]
        let t2: Set = ["2", "5"]
        let t3 = t1.intersection(t2) //["2"]
        print(t3)
    }
    
    func formUnion() {
        var t1: Set = ["1", "2", "3", "4"]
        let t2: Set = ["2", "5"]
        t1.formUnion(t2) //["3", "4", "5", "1", "2"]
        print(t1)
    }
    
    //MARK: Iterator
    func iteratorUse() {
        for item in PrefixSequence(string: "hello word") {
            print(item)
        }
    }
}


struct PrefixtIterator: IteratorProtocol {
    let string: String
    var offSet: String.Index
    
    init(string: String) {
        self.string = string
        offSet = string.startIndex
    }
    
    mutating func next() -> Substring? {
        guard offSet < string.endIndex else {
            return nil
        }
        offSet = string.index(after: offSet)
        return string[..<offSet]
    }
    
}


struct PrefixSequence: Sequence {
    let string: String
    
    __consuming func makeIterator() -> PrefixtIterator {
        return PrefixtIterator(string: string)
    }
    
}
