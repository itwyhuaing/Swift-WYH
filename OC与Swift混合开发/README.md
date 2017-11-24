# OC与Swift混合开发

项目混合式开发有段时间了，慢慢补上踩过的坑。

##### 第一部分 : 工程配置

```
系统环境与配置：
macOS Sierra 10.12.6 , Xcode9.0 , Swift4.0
```

* 两种场景： OC工程中引用Swift  或者 Swift工程中引用OC
1. 在OC工程中第一次创建Swift文件 或者 在Swift工程中创建OC文件都会出现弹框提示你创建一个桥接文件，该文件命名规则（ 工程名-Bridging-Header.h）
2. 工程配置有两个地方，且两个地方都需要配置正确，具体如图所示：


![image](https://github.com/itwyhuaing/Swift-WYH/blob/master/OC与Swift混合开发/image/1.png)


![image](https://github.com/itwyhuaing/Swift-WYH/blob/master/OC与Swift混合开发/image/2.png)


3. Swift工程中引用OC文件需要将相应的头文件导入到桥接文件中
4. 配置工程及简单使用 [OCProjectDemo](https://github.com/itwyhuaing/Swift-WYH/tree/master/OC与Swift混合开发/OCProject)    [SwiftProjectDemo](https://github.com/itwyhuaing/Swift-WYH/tree/master/OC与Swift混合开发/SwiftProject)
