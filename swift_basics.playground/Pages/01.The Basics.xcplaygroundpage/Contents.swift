//: [Previous](@previous)
import Foundation
/*:
### 常量和变量
常量用`let`声明，变量用`var`声明。常量声明后不可改变。常、变量声明就固定，不可以互转。
也可以在一行中声明多个常量或变量
> `Swift`不建议加分号，但允许出现分号
*/
let maxNum = 100
//maxNum = 10不允许
var index = 2
index = 3;

var x = 1.1, y = 1.2, z = 1.3
/*:
声明变量赋初值会自动给变量一个由`Swift`推断出来的数据类型，可以点击上面声明的几个常/变量来看其数据类型
同时，也可以显示的为变量添加类型，不过一般很少用
*/
var myID: String = "wossoneri"
myID = "wOw + rossoneri"

/*: 
前面说可以在一行中声明多个常/变量，尝试下面写法：
`var x, y, z`
发现报错
在声明后面添加 **类型标注** 即可解决错误
*/
var x1, y1, z1: Double
/*: 
> 所以可以看出`Swift`是强类型语言，每个变量声明的时候必须要有一个类型，保证后面代码不出错

对于常/变量的命名，可以使用任意你喜欢的字符来命名，包括Unicode字符（后面会看到`Swift`对于Unicode的支持）
*/
let π = 3.14159
let 你好 = "hello world"
let 🙈 = "非礼勿视"
/*:
常量变量名不能包含数学符号，箭头，保留的（或非法的）Unicode码位，连线与制表符。也不能以数字开头。

 > 关于`print(_:separator:terminator:)`函数
 若想输出值使用`print()`即可。
 该函数三个参数，参数1为要输出的对象，参数2为用来分隔参数1的内容，参数3为输出结尾的内容。
 这三个参数都有其默认值，分别为`\n`,` `,`回车符`
 注意观察下面输出结果
 */
print(你好)
print()
let p1 = 1, p2 = 2, p3 = 3, p4 = true
print(p1, p2, p3, p4)
print(p1, p2, p3, separator:",")
print(p1, p2, p3, terminator:".")
print(p1, p2, p3, separator:",", terminator:".")

/*:
字符串插值string interpolation
Swift可以把常/变量名当做占位符加入到长字符串中，然后用这个量当前值替代这些占位符
 */
print(p2, "*", p3, "=", p2 * p3)
print("\(p2) * \(p3) = \(p2 * p3)")


/*:
### 整数
Swift提供了8，16，32，64位的有符号和无符号整数
整数范围可以通过`max``min`属性访问
一般来说不需要专门指定整数长度。Swift提供了特殊整数类型`Int`和`UInt`，长度和当前平台字长相同
 > 尽量不要使用`UInt`，除非你真的需要存储一个和当前平台原生字长相同的无符号整数。除了这种情况，最好使用`Int`，即使你要存储的值已知是非负的。统一使用`Int`可以提高代码的可复用性，避免不同类型数字之间的转换，并且匹配数字的类型推断

 */
var imInt: Int = 80
var int8: Int8 = 8
var int16: Int16 = 16
var int32: Int32 = 32
var uint16: UInt16 = 16

let m = int32 + Int32(int8)
/*:
 > 上一行代码又看到Swift是强类型语言。
 虽然`Int8`和`Int32`都属于`int`，但他们之间计算不会自动进行类型转换，除非手动强转。包括`Float`和`Double`也不能直接加减，必须显示进行类型转换。这就保证减少出错几率，让你养成规范代码的习惯。

### 数值型字面量
对变量赋值的时候，可以用不同进制去赋值，结果是一样的。
另外，如果值的位数很多的话，可以使用下划线隔开，也可以添加额外的0，方便阅读
*/
var decimalInt: Int = 17
var binaryInt: Int = 0b10001
var octalInt: Int = 0o21
var hexadecimalInt: Int = 0x11

var longNumber = 010_000_000

/*:
### 浮点数
* `Double`表示64位浮点数。当需要存储很大或者很高精度的浮点数时，请用此类型
* `Float`表示32位浮点数。精度要求不高的话使用此类型
> `Double`精确度很高，至少有15位数字，而`Float`最少只有6位数字。选择哪个类型取决于你的代码需要处理的值的范围。

浮点数显示也可以用下划线截断，方便阅读。
 同时可以用科学计数。
*/
var a = 1.25e3
var a1 = 1.25e-3
var a2 = 001_000_000.000_001

/*:
### 类型安全和类型推断
Swift是类型安全语言，它会在编译时进行类型检查，并标记错误。对于没有显示指定类型的变量，Swift也会使用`类型推断`为其选择合适类型。
对于浮点数，Swift总会选择`Double`而不是`Float`。
 */
let pi = 3.14159
let anotherPi = 3 + 0.14159

/*:
### 数值类型转换
通常来讲，即使代码中的整数常量和变量已知非负，也请使用Int类型。总是使用默认的整数类型可以保证你的整数常量和变量可以直接被复用并且可以匹配整数类字面量的类型推断。
 
只有在必要的时候才使用其他整数类型，比如要处理外部的长度明确的数据或者为了优化性能、内存占用等等。使用显式指定长度的类型可以及时发现值溢出并且可以暗示正在处理特殊数据。

#### 整数转换
不同整数类型的变量和常量可以存储不同范围的数字。如`Int8`的范围`-128`~`127`，而`UInt8`范围`0`~`255`。数字一旦超过其可存储范围就会报错。所以你必须根据实际情况选择性使用类型转换。
像前面的例子，`int32`和`int8`就不能直接相加，需要进行`Int32(int8)`来转换。该方法`SomeType(ofInitialValue)`是调用Swift构造器并传入一个初始值的默认方法。初始值并不是任意类型，这个先不讨论。
 
#### 浮点数转换
整数和浮点数转换必须显示指定类型。整数可以直接转为浮点数，但浮点数转换到整数就会产生截断。
 */
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi0 = Double(three) + pointOneFourOneFiveNine
let integerPi = Int(pi0)

/*:
### 类型别名
类似终端里的`alias`，这里就放个示例
*/
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

/*:
### 布尔值
`Bool`的两个值`true`和`false`，全部小写
> 这里又有一个要注意的。其他语言在`if`条件里可以直接写`1`表示`true`，但Swift不允许。还是因为其对类型要求很严格，只接受`Bool`类型，而`1`是作为`Int`类型，所以类型就不匹配，不可以用。这个方法可以避免错误并保证这块代码的意图总是清晰的。
 */
let orangesAreOrange = true
let turnipsAreDelicious = false
let i = 1
if i == 1 { //if i {} 不可
    
}

/*:
### 元组tuples
元组是把多个值组和成一个复合值。元组内的值可以是任意类型。用在函数返回值非常好用，尤其是需要返回多个返回值时。
> 适合临时组织的轻量级的数据集合。遇到复杂的结构，请使用类或结构体
 */
let http404Error = (404, "http")        //一个类型为(Int, String)的元组
let _http404Error: (Int, String) = (404, "http")
//: 可以用下面方法把元组分解成单独的常/变量
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode) \nThe status message is \(statusMessage)")
//: 如果只需要一部分元组值，用下划线来忽略不要的内容
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
//: 也可以通过下标来访问元组内的元素
print("The status code is \(http404Error.0) \nThe status message is \(http404Error.1)")
//: 还可以为元组中元素命名，用名称来访问
let http200status = (statusCode:200, description:"OK")
print("The status code is \(http200status.statusCode) \nThe status message is \(http200status.description)")

/*:
### 可选类型optionals
使用可选类型来处理值可能缺失的情况。
比如把`String`类型转换成`Int`类型，有的时候可以，但有的时候不可以。
 */
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
/*： 可以看到`convertNumber`的类型为`Int?`，把`String`转为`Int`的构造器可能会失败，所以返回一个可选类型`optional Int`，写作`Int?`，表示可能包含`Int`。
你可以为可选变量赋值为`nil`表示没有值。或者声明一个可选量但没赋值，系统会默认设置为`nil`
 > `nil`只能用于可选常量或可选变量
*/
var serverResponseCode: Int? = 404
serverResponseCode = nil
var surveyAnswer: String?
//: > Swift的`nil`和Objective-C中的`nil`并不一样。在O-C中，`nil`是一个指向不存在对象的指针。Swift的`nil`不是指针——它是确定的值，用来表示缺失。任何类型的可选状态都可置为`nil`，不限于对象类型。
//: 你可以使用`if`和`nil`比较判断是否包含值。当**确定**(不确定会报错哦)包含值之后，在可选的名字后加一个叹号`!`**强制解析(forced unwrapping)**获取值。这里`?`和`!`和其表达的结果是不是很贴切！！！！
if convertedNumber != nil {
    print("convertNumber contains value:\(convertedNumber!).")
}
/*:使用**可选绑定optional binding**来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。可选绑定可以用在`if``while`中，同时可以判断可选类型有没有值和赋值。
 */
if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
}
//: 也可以包含多个可选绑定在`if`中，并用`where`子句做判断
if let firstNum = Int("4"), secondNum = Int("42") where firstNum < secondNum {
    print("\(firstNum) < \(secondNum)")
}
/*:
隐式解析可选类型
有时候，在程序架构中，在第一次被赋值后，可以确定一个可选类型总是有值，所以不需要每次都判断解析可选值。
这种类型的可选状态定义为隐式解析可选类型(implicitly unwrapped optionals)。把`?`改成`!`来声明一个隐式解析可选类型。
 */
let possibleString: String? = "An optional String"
let forcedString: String = possibleString!  //需要叹号取值
let assumedString: String! = "An implicitly unwrapped optional string"
let implicitString: String = assumedString  //可以不加叹号  也可以加叹号
/*:
 ### 断言assertion
可选类型可以让你判断值是否存在，你可以在代码中优雅地处理值缺失的情况。然而，在某些情况下，如果值缺失或者值并不满足特定的条件，你的代码可能没办法继续执行。这时，你可以在你的代码中触发一个断言（assertion）来结束代码运行并通过调试来找到值缺失的原因。
用断言调试
断言在运行时判断一个逻辑条件是否为`true`。可以用断言来保证运行其他代码之前，某些重要条件已被满足。如果条件为`true`，代码继续运行，否则终止。
如果你的代码在调试环境下触发了一个断言，你可以清楚地看到不合法的状态发生在哪里并检查断言被触发时你的应用的状态。此外，断言允许你附加一条调试信息。
可以使用全局`assert(_:_file:line:)`来写一个断言。向这个函数传入一个结果为`true`或者`false`的表达式以及一条信息。表达式结果为`false`时信息会显示
 */
let age = -3
//assert(age >= 0, "A person`s age cannot be less than zero")
//assert(age >= 0)
/*: 
 > 当条件可能为假时使用断言，但最终要保证条件为真，这样代码才能运行。
 适用场景： 1.整数类型的下标索引被传入一个自定义下标脚本实现，但是下标索引值肯呢个太小或者太大。2.需要给函数传入一个值，但是非法的值可能导致函数不能正常执行。3.一个可选值现在是`nil`，但是后面的代码运行需要一个非`nil`值
*/






//: [Next](@next)
