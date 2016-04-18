//: [Previous](@previous)

import Foundation

/*:
 > 运算符部分各语言差别不大，主要记一些Swift改进的地方
 
赋值运算符 `=` 的赋值操作并不返回任何值。所以不能用 `if x = y {}`，因为 `x = y` 不返回任何值。所以这个特性使你无法把 `==` 错写成 `=`，避免了错误。
使用算术运算符，默认情况下不允许在数值运算中出现溢出情况。但可以使用Swift的溢出运算符来实现溢出运算，如 `a &+ b`。加法也可用于 `String` 的拼接。
 */
"hello," + "world"
//: 求余运算 `a % b` 是 `a = (b x 倍数) + 余数`，对负数求余会把符号忽略。
var u = 2.5
var v = 1.2
u % v
u % -v
//: Swift也提供恒等 `===` 和不恒等 `!==` 用来判断两个对象是否引用同一个对象实例
/*: 空合运算符Nil Coalescing Operator: `(a ?? b)`将对可选类型`a`进行空判断，若`a`包含值就进行解封，否则返回默认值`b`。
 * 表达式`a`必须是`Optional`类型
 * 默认值`b`类型必须和`a`存储值的类型一致
空合运算符是下列三目运算符的简化表达：`a != nil ? a! : b`
*/
let defaultColorName = "red"
var userDefinedColorName: String? //= "blue"
var colorNameToUse = userDefinedColorName ?? defaultColorName
//: 区间运算符 闭区间 `...` 半开区间 `..<`




//: [Next](@next)
