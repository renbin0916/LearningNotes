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
        mergeDict()
    }

    
    func usedReduce() {
        let temp = [1, 3, 5, 7]
        let result = temp.reduce(0) { (total, item) in
            total + item
        }
        print(result)
//        let result2 = temp.reduce(0, +)
    }
    
    func usedReduse2() {
        let temp = [1, 3, 5, 7]
//        temp.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result#>)
//        temp.reduce(into: <#T##Result#>, <#T##updateAccumulatingResult: (inout Result, Int) throws -> ()##(inout Result, Int) throws -> ()#>)
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
        let numbers = ["1", "2", "three", "///5///", "5"]

        // 此时用flatMap会报警告，应为返回值是可选的， compactMap为之前flatMap的去空方法的重构方法名
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
    
    func mergeDict() {
        var dict1 = ["name": "Tom", "age": "3"]
        let dict2 = ["name": "Jerry", "age": "3", "sex": "man"]
        dict1.merge(dict2) { (t1, t2) -> String in
            return t1            
        }
        
        
        let temp = "helloworld".map { ($0, 1)}
        print(temp)
        print(Dictionary(temp, uniquingKeysWith: +))
    }
}


