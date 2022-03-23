import UIKit

func fibonacci(n: Int) {

    //Write your code here.
    var first = 0
    var second = 1
    var result: String = "[0, 1"
    var index = 2
//    while index < n {
//        first += second
//        result.append(", \(String(first))")
//        index += 1
//        if index < n {
//            second += first
//            result.append(", \(second)")
//            index += 1
//        }
//
//
//    }
        
    result.append("]")

    print(result)

}

fibonacci(n: 10)
