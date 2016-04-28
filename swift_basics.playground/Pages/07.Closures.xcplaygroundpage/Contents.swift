//: [Previous](@previous)

import Foundation


//闭包


var arr: [Int] = []
for _ in 0 ..< 10 {
    arr.append(random() % 10)
}

arr

func biggerNumberFirst( a: Int, _ b: Int ) -> Bool {
    return a > b
}
arr.sort(biggerNumberFirst)

arr.sort( { (a: Int, b: Int) -> Bool in
    return a > b
})

arr.sort({ a, b in return a > b })

arr.sort({ a, b in a > b })

arr.sort({ $0 > $1 })

arr.sort(>)

//结尾闭包
arr.sort/*()*/ {a, b in
    return a > b
}

arr.map { (var number) -> String in
    var res = ""
    repeat {
        res = String(number % 2) + res
        number /= 2
    } while number != 0
    return res
}


func runningMetersWithMetersPerDay( metersPerDay: Int) -> () -> Int {
    var totalMeters = 0
    return {
        totalMeters += metersPerDay
        return totalMeters
    }
    
}


var planA = runningMetersWithMetersPerDay(2000)
planA()
planA()
planA()

var planB = runningMetersWithMetersPerDay(5000)
planB()
planB()

var anotherPlan = planB
anotherPlan()
planB()

let planC = runningMetersWithMetersPerDay(3000)
planC()
planC()

//planC = runningMetersWithMetersPerDay(3000)







//: [Next](@next)
