

---
##### 变量与常量

* 使用let来声明常量，使用var来声明变量;

> Swift中的常量必须在定义时初始化(OC可以不初始化), 否则会报错
常量的用途: 某些值以后不需要改变, 例如身份证

> 在Swift中如果想要先定义一个变量, 以后使用时再初始化必须在定义时告诉编译器变量的类型(类型标注);

> 在Swift中如果定义的同时初始化一个变量,可以不用写数据类型, 编译期会根据初始化的值自动推断出变量的类型(其它语言是没有类型推断的);

> 以后在开发中如果在定义的同时初始化就没有必要指定数据类型, 除非需要明确数据类型的长度或者定义时不初始化才需要指定数据类型。

```
let num4 = 10

var num: Int
num = 10;

var num2:Int = 20
var num3 = 20
```

##### 常见数据类型/结构

> Swift 注意关键字大写, Swift 是类型安全的语言, 如果取值错误会直接报错, 而OC不会;

> 在Swift中“值永远不会被隐式转换为其他类型”(OC中可以隐式类型转换);

> 数据类型转换，Swift 不允许隐式类型转换, 但可以使用显示类型转换(强制类型转换)

* 整型、浮点型、Bool

```
// Double()并不会修改intValue的值, 而是通过intValue的值生成一个临时的值赋值给doubleValue
var intValue:Int = 10
var doubleValue:Double
doubleValue = Double(intValue)

//整型
var intValue:Int = 10

//浮点型
var intValue1:Double = 10.10 // 表示64位浮点数
var intValue2:Float = 8.9    // 表示32位浮点数

//如果按照长度划分,Swift中的长短比OC更加精确
var intValue3:Int8 = 6
var intValue4:Int16 = 7
var intValue5:Int32 = 8
var intValue6:Int64 = 9

// 有符号无符号, 默认是有符号的(UInt8/UInt16/UInt32/UInt64)
// 注意：无符号的数比有符号的取值范围更大, 因为符号位也用来存值
var uintValue7:UInt = 10

// Bool true false

```

* 元组 - 将多个相同或者不同类型的值用一个小括号括起来就是一个元组

```
let student = ("tencent",30,99.8)
print(student)
print(student.0)
print(student.1)
print(student.2)

let student2 = (name:"hi",age:20,core:99.2)
print(student2.name)
print(student2.age)
print(student2.core)

let (name, age, score) = ("xioahan", 30 ,99.9)
print(name)
print(age)
print(score)

如果不关心元组中的某个值可以利用 "_" 通配符来忽略提取
let (name1, age1, _) = ("hello", 30, 99.9)
print(name1)
print(age1)

// 元组支持嵌套
var t_t : (String, (String, Int)) = ("基本信息",("腾讯", 28))
// 数组嵌套元素
var moneyArray:[(Int,String)] = [(20,"Cidy"), (18,"Nickle"), (14, "Quarter")]
// 字典嵌套元组
var userInfoDic:[String:(Int,String)] = ["cidy":(20,"girl"), "nickl":(15,"boy")]
print(userInfoDic) // 打印:["cidy": (20, "girl"), "nickl": (15, "boy")]


// 可以将元组的类型重定义为一个类型名
typealias namedFinshesType = (first:String, second:String, third:String)
let namedFinshes : namedFinshesType = ("aaa", "bbb", "ccc")

// 元组访问，可以按顺序点语法获取也可以依据变量名点语法获取，也可以用多个变量对元组同时进行访问
var t4 = (name:"小韩哥", 22)
var (name3, age3) = t4 // 即可同时获取name, age
var (name4, _) = t4 // 不需要时参数可以缺省

// 注意, 元组为数值类型, 因此元组的拷贝是值拷贝
var t5 = (name:"腾讯", 28)
var t5_copy = t5
t5.name = "李白"
print("\(t5_copy.name)") // 打印: 腾讯
```

* 字符、字符串

```
// 字符串长度
var stringVlaue = "abc腾讯"
print(stringVlaue.lengthOfBytes(using: String.Encoding.utf8))

// 字符串拼接
var str1 = "abc"
var str2 = "hjq"
var str = str1 + str2

// 格式化字符串
var index = 1
var str3 = "http://www.blog26.com/pic/\(index).png"

// 字符串比较
var str4 = "abc"
var str5 = "abc"
if str4 == str5 {
print("相等")
}else{
print("不相等")
}

var str6 = "abd"
var str7 = "abc"
if str6 >= str7 {
print("大于等于")
}else{
print("不大于等于")
}

// 判断前后缀
var str8 = "http://www.blog26.com"
if str8.hasPrefix("www")
{
print("是url")
}
if str8.hasSuffix(".com")
{
print("是顶级域名")
}

// 大小写转换
var str9 = "abc.txt"
print(str9.uppercased())
print(str9.lowercased())

// 转换为基本数据类型
var str10 = "250"
var numerber:Int? = Int(str10)
if numerber != nil
{
print(numerber!) // 2.0可以自动拆包,3.0以后则不会
}

```

* 数组

```

// 空数组
var arr6 = [Int]()
var arr7 = Array<Int>()

// 有值数组
var arr0 = [1,2,3]
var arr1: Array = [1,2,3]
var arr2: Array<Int> = [1,2,3]
var arr3: [Int] = [1,2,3]

//不可变数组
let arr8 : [Int] = []

//可变数组
var arr9 : [String] = [String]()

// 元素类型数组
var arr10 = [1,"hjq",1.65] as [Any]

// 数组操作，获取长度
var arr12 = [1,2,3]
print(arr12.count)

// 判断是否为空
var arr13 = [1,2,3]
print(arr13.isEmpty)

// 检索
var arr14 = [1,2,3,4]
print(arr14[0])

// 追加
var arr15 = [1,2,3]
arr15.append(4)

// 插入
var arr17 = [1,2,3]
arr17.insert(4, at: 0)

// 更新
var arr18 = [1,2,3]
arr18[0] = 0

// 删除
var arr19 = [1,2,3]
arr19.remove(at: 0)

var arr20 = [1,2,3,4]
arr20.removeLast()

var arr21 = [1,2,3,4]
arr21.removeFirst()

var arr22 = [1,2,3,4]
arr22.removeAll(keepingCapacity: true) // 是否保持容量, 如果为true, 即使删除了容量依然存在, 容量是2的倍数


// 移除某区间位置的数组元素
var arr23 = [1,2,3]
arr23.removeSubrange(0...1)


// 替换某区间位置的数组元素
var arr24 = [1,2,3]
arr24.replaceSubrange(0..<1, with: [8])

// 遍历
var arr1 = [1,2,3]
for i in 0..<arr1.count {
print(arr1[i])
}

for number in arr1 {
print(number)
}

//取出数组中某个区间范围的值
var arr2 = [1,2,3]
for number in arr2[0..<3] {
print(number)
}



```


* 字典

```
// 生成字典
let dic:[String:Any] = ["name":"zhang","age":12]
var dict = ["name":"hjq","age":25.5] as Any
var dict2:Dictionary<String,AnyObject> = ["name":"jq" as AnyObject,"age":25.5 as AnyObject]
var dict4:[String:AnyObject] = ["name":"hjq" as AnyObject ,"age":30 as AnyObject ]

// 数组字典
let arrDic:[[String:Any]] = [
["name":"hello","age":22],
["name":"hi","age":23]
]

// 可变字典的增删改查 - key存在则为修改, key不存在则为添加
var dictionary:[String:Any] = ["name":"hjq","age":23]
// 增加键值对
dictionary["score"] = 98
// 修改键值对
dictionary["age"] = 80
// 删除键值对
dictionary.removeValue(forKey: "name")

// 字典合并
var dic5 = ["name":"hihello","age":23] as [String : Any]
let dic6 = ["teacher":"wang"]
for (key,value) in dic6 {
dic5[key] = value
}

// 获取所有 key / value
Array(dict.keys)
Array(dict.values)

// 字典遍历
//写法一
for e in dictionary {
print("key = \(e.key) value = \(e.value)")
}

//写法二
for (key,value) in dictionary {
print("key = \(key) value = \(value)")
}

// 可变集合 - 数组
var array6 = [String]()
array6.append("1")
array6.append("2")

// 可变集合 - set
var set1 = Set<String>()
set1.insert("1")
set1.insert("2")

// 可变集合 - Dictionary
var studentDic = Dictionary <String,String>()
studentDic["1"] = "Lucy"
studentDic["2"] = "John"


```


* 枚举

```
Swift 中的枚举可以像类和结构体一样增加属性和方法 。

格式:
enum Method{
case 枚举值
}

enum Method {
case Add
case Sub
case Mul
case Div
//可以连在一起写
//    case Add, Sub, Mul, Div
}

// 可以使用枚举类型变量或者常量接收枚举值
var m:Method = .Add

// 注意: 如果变量或者常量没有指定类型, 那么前面必须加上该值属于哪个枚举类型
var m1 = Method.Add

```

* 结构体 - 结构体是用于封装不同或相同类型的数据的, Swift中的结构体是一类类型, 可以定义属性和方法(甚至构造方法和析构方法等)；结构体是值类型

```

格式:
struct 结构体名称 {
结构体属性和方法
}

全部有默认值的结构体
struct Rect {
    var width: Double = 0.0
    var height:Double = 0.0
}

并非全部有默认值的结构体
struct Rect2 {
    var width:Double
    var height:Double = 0.0
}

如果结构体的属性有默认值, 可以直接使用()构造一个结构体
var r = Rect()
print("width = \(r.width), height = \(r.height)")


如果结构体的属性没有默认值, 必须使用逐一构造器实例化结构体
逐一构造器
var r1 = Rect2(width: 10.0, height: 10.0)


结构体中定义成员方法
在C和OC中结构体只有属性, 而Swift中结构体中还可以定义方法
struct Rect3 {
    var width:Double
    var height:Double = 0.0
    // 1.给结构体定义一个方法, 该方法属于该结构体
    // 2.结构体中的成员方法必须使用某个实例调用
    // 3.成员方法可以访问成员属性
    func getWidth() -> Double {
        return width
    }
}
var r2 = Rect3(width: 10.0, height: 10.0)
结构体中的成员方法是和某个实例对象绑定在一起的, 因此谁调用, 方法中访问的属性就是谁
取得r2这个对象的宽度 print(r2.getWidth())



```


7. 函数

```

```


8. 属性

```

```

9. 方法

```

```

10. 继承

```

```

11. 多态

```

```


12. 协议

```

```


13. 扩展

```

```

14. 泛型

```

```


15. KVC / KVO

```

```
