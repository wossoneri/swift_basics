//: [Previous](@previous)

import Foundation
import UIKit
/*: 
 ## 集合类型
 * 集合的可变性 (Mutability of Collections)
 * 数组 (Arrays)
 * 集合 (set)
 * 字典 (Dictionaries)
 
 Swift中存储的数据值类型必须明确。这意味着我们不能把错误的数据类型插入其中，但也说明我们完全可以对取回值的类型非常自信。
 */
UIImage.init(named: "CollectionTypes_intro")


/*:
 ### 数组
 
 数组初始化
 

 */

var numbers/*: [Int]*/ = [0, 1, 2, 3, 4, 5]
//泛型概念初始化
//var numbers: Array<Int> = [0, 1, 2, 3, 4, 5]

var vowels/*: [Character/*双引号默认是String*/] */ = ["A", "E", "I", "O", "U"]

var emptyArray1: [Int] = []
var emptyArray2: Array<Int> = []
var emptyArray3 = [Int]() //构造函数
var emptyArray4 = Array<Int>()

var allZeros = [Int](count: 5, repeatedValue: 0)
var allZeros2 = Array<Int>(count: 5, repeatedValue: 3)

var array/*: NSArray 最好显示声明*/ = [] //NSArray

//用法
vowels.count
numbers.isEmpty
emptyArray1.isEmpty

vowels[2] //第三个  注意边界
vowels.first //可选类型
vowels.last
emptyArray1.first

if let firstVowel = vowels.first {
    print("The first vowel is " + firstVowel)
}
vowels.first!
vowels[vowels.count - 1]

numbers.minElement()
vowels.maxElement()

numbers[2..<4]
numbers[2..<numbers.count]

vowels.contains("A")
vowels.contains("B")

vowels.indexOf("E")
vowels.indexOf("C")

for index in 0 ..< numbers.count {
    numbers[index]
}
for number in numbers {
    number
}
//要索引位置
for (index, vowel) in vowels.enumerate() {
    print("\(index + 1): \(vowel)")
}

var oneToFive = [0, 1, 2, 3, 4, 5]
numbers == oneToFive //Swift比较值  并不是比较引用的指针


var names = ["Terry", "Oven", "Rooney"] //声明 var
names.append("Messi")
names += ["Ronaldo"]
names.insert("Shevchenko", atIndex: 2)

//names.removeLast()
//names.removeFirst()
//names.removeAtIndex(3)
//names.removeRange(0..<2)
//names.removeAll()

names[0] = "Henry"
names[1...3] = ["You", "Me", "Him"]
names
names[1...3] = ["Just Me"]
names

//二维数组
var board: [ [Int] ]/*Array<Array<Int>>*/ =
            [[1024, 16, 2,  0],
             [256,  4,  2,  0],
             [64,   2,  0,  0],
             [2,    0,  0,  0]]
board[0]
board[0][0]
board.count
board[0].count
board[0].append(0)
board

board.append([0, 0, 0, 0])
board
board += [[1, 1, 1, 1]]





/*:
 ### 字典
 */
var dict = ["MUN":"曼联", "MC":"曼城", "TOT":"热刺", "ARS":"阿森纳"]
//var dict: [String : String] =
//var dict: Dictionary<String,String>
var emptyDictionary1:[String:Int] = [:]
var emptyDictionary2:Dictionary<Int, String> = [:]
var emptyDictionary3 = [String:Int]()
var emptyDictionary4 = Dictionary<Int, Int>()

print(dict["MUN"])
if let value = dict["MUN"] {
    
}

dict.count
dict.isEmpty

dict.keys
Array(dict.keys)
Array(dict.values)

for (key, value) in dict {
    
}

let dict1 = [1:"A", 2:"B", 3:"C"]
let dict2 = [1:"A", 2:"B", 3:"C"]
let dict3 = [2:"B", 1:"A", 3:"C"]
dict1 == dict2
dict2 == dict3

var user = ["name":"wOw", "password":"123123", "occupation":"programmer"]

user["occupation"] = "freelancer"
let oldPassword = user.updateValue("112233", forKey: "password")
user

if let oldPassword = oldPassword, newPassword = user["password"] where oldPassword == newPassword {
    print("两次密码一致")
}

//添加内容
user["email"] = "siyolatte@gmail.com"
user
user.updateValue("wossoneri.com", forKey: "blog")
user

//delete
user["blog"] = nil
user
user.removeValueForKey("email")//有返回值
user

if let email = user.removeValueForKey("email") {
    
}





/*:
 ### 集合
 */
var skillsOfA: Set<String> = ["swift", "OC", "OC"] //集合的内容是唯一的  无序的

var emptySet1: Set<Int> = []
var emptySet2 = Set<Double>()

var vowelSet = Set(["A", "E", "I", "O", "U"])
var skillsOfB: Set = ["HTML", "CSS", "Javascript"]

skillsOfA.count
skillsOfA.isEmpty
skillsOfA.first //随机取一个

skillsOfA.contains("swift")

for skill in skillsOfA {
    
}

let setA: Set = [1, 2, 3]
let setB: Set = [1, 2, 3, 2, 1]
setA == setB

var skillsOfC: Set<String> = []

skillsOfC.insert("swiwft")
skillsOfC.insert("CSS")
skillsOfC.insert("HTML")
skillsOfC.insert("HTML")

skillsOfC.remove("HTML")
skillsOfC
skillsOfC.remove("JS")
skillsOfC


//集合操作
//并集 union不改变自己, unionInPlace改变自己
skillsOfA = Set(["swift", "OC"])
skillsOfB = Set(["HTML", "CSS", "Javascript"])
skillsOfC = Set(["swift", "HTML", "CSS"])

skillsOfA.union(skillsOfC)
skillsOfA
//skillsOfA.unionInPlace(skillsOfC)
//skillsOfA

//交集 intersect intersectInPlace
skillsOfA.intersect(skillsOfC)

//减法
skillsOfA.subtract(skillsOfC)

//亦或
skillsOfA.exclusiveOr(skillsOfC)


skillsOfA.union(["java", "android"])//数组也可以

var skillsOfD: Set = ["swift"]
skillsOfD.isSubsetOf(skillsOfA)
skillsOfD.isStrictSubsetOf(skillsOfA)

skillsOfA.isSupersetOf(skillsOfD)
skillsOfA.isStrictSupersetOf(skillsOfD)

skillsOfA.isDisjointWith(skillsOfD)





//: [Next](@next)
