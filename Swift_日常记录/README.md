# Swift-日常学习记录


#### 字符串转数字
* 十进制字符串转数字
```
let s = "123"
let i = (s as NSString).intValue
```

* 十六进制字符串转数字 (该部分代码取自：[原文](http://www.hangge.com/blog/cache/detail_698.html))

```
func hexStringToInt(from:String) -> Int {
    let str = from.uppercased()
    var sum = 0
    for i in str.utf8 {
        print("i = %d",i)
        sum = sum * 16 + Int(i) - 48 // 0-9 从48开始
        if i >= 65 {                 // A-Z 从65开始，但有初始值10，所以应该是减去55
            sum -= 7
        }
    }
    return sum
}

let str = "000021"
let value = hexStringToInt(from:str)
print(value)
```

#### 数字转字符串
```
let f0 = 123.9988
let f1 = "\(f0)"
let f2 = String(format:"%.2f - %@",f0,f1)
```
