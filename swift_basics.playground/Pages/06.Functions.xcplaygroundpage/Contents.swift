//: [Previous](@previous)

import UIKit



//func sayHelloTo( name: String? ) -> String {
//    return "Hello " + (name ?? "guest")
//}
//
//var nickName: String? = nil
//sayHelloTo(nickName)

func printHello() -> Void/*()*/ {
    print("Hello")
}


//使用元组返回多个值
func findMaxAndMin( numbers: [Int] ) -> ( max: Int, min: Int )? {
//    if numbers.isEmpty {
//        return nil
//    }

    guard numbers.count > 0 else {
        return nil
    }
    
    var minValue = numbers[0]
    var maxValue = numbers[0]
    for number in numbers {
        minValue = minValue < number ? minValue : number
        maxValue = maxValue > number ? maxValue : number
    }
    
    return ( maxValue, minValue)
}

var  scores: [Int]? = [202, 1234, 5678, 334, 982, 555]
scores = scores ?? []

let result = findMaxAndMin( scores! )
result!.max
result!.min

func sayHelloTo( name: String, withGreetingWord/*外部参数名*/ greetings: String = "Hello", punctuation: String = "!" ) -> String {
    return "\(greetings), \(name)\(punctuation)"
}

sayHelloTo("wOw", withGreetingWord: "Glad to meet you")
sayHelloTo("wossoneri", withGreetingWord: "Hi")
sayHelloTo("wossoneri")


func mutipleOf( num1: Int, _ num2: Int) -> Int {//省略外部名
    return num1 * num2
}
mutipleOf(4, 2)

//变长参数
func mean( numbers: Double ... ) -> Double {
    var sum: Double = 0
    
    for number in numbers {
        sum += number
    }
    return sum / Double(numbers.count)
}
mean(1, 2, 3)

//函数参数默认是let  mean( let numbers)
//常量参数

func swapTwoInts( inout a: Int, inout _ b: Int) {
//    let t: Int = a
//    a = b
//    b = t
    (a, b) = (b, a)
}
var x: Int = 1
var y: Int = 3
swapTwoInts(&x, &y)
x
y
swap(&x, &y)
x
y
//数组 字典都是按值传入的  都要inout显式引用


//函数式编程
func add( a: Int, _ b: Int  ) -> Int {
    return a + b
}

let anotherAdd: (Int, Int)->Int = add
anotherAdd(3, 4)

var arr: [Int] = []
for _ in 0 ..< 10 {
    arr.append(random() % 10)
}

arr

func biggerNumberFirst( a: Int, _ b: Int ) -> Bool {
    return a > b
}
arr.sort(biggerNumberFirst)

//试试排个数组什么的



func changeScores( inout scores: [Int], by changeScore: (Int)->Int ) {
    for (index, score) in scores.enumerate() {
        scores[index] = changeScore(score)
    }
}

func changeScore(score: Int) -> Int {
    return Int(sqrt(Double(score)) * 10)
}

var scores1 = [55, 90, 69, 46, 88, 79]
changeScores(&scores1, by: changeScore)

//map
scores1.map(changeScore)

func isPassOrFail(score: Int) -> String {
    return score < 60 ? "Fail" : "Pass"
}
scores1.map(isPassOrFail)

//filter
func fail(score: Int) -> Bool {
    return score < 60
}
scores1.filter(fail)

//reduce
func add1(num1: Int, _ num2: Int) -> Int {
    return num1 + num2
}
scores1.reduce(0, combine: add1)
scores1.reduce(0, combine: +)




// 函数嵌套
func tier1MailFeeByWeight( weight: Int ) -> Int {
    return 1 * weight
}

func tier2MailFeeByWeight( weight: Int ) -> Int {
    return 3 * weight
}

func feeByUnitPrice(price: Int, weight: Int) -> Int {
    
    
    func chooseMailFeeCalculationByWeight( weight: Int ) -> (Int) -> Int {
        return weight > 10 ? tier2MailFeeByWeight : tier1MailFeeByWeight
    }

    
    let mailFeeByWeight = chooseMailFeeCalculationByWeight(weight)
    return mailFeeByWeight( weight ) + price * weight
}











//: [Next](@next)
