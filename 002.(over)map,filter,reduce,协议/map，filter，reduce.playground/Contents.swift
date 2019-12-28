import UIKit

/*
l    作业1（闭包、扩展、泛型）：
（1）    给定一个Dictionary数组，Dictionary包含key值name和age，用map函数返回age字符串数组;
*/
let theDic1:[String: String] = ["name": "mary", "age": "15"]
let theDic2:[String: String] = ["name": "lucy", "age": "16"]
let theDic3:[String: String] = ["name": "liu", "age": "18"]
let theArray = [theDic1, theDic2, theDic3]
print(theArray)
let overArray = theArray.map(){myDic -> String in
    return myDic["age"]!
}
print(overArray)

/*
（2）    给定一个String数组，用filter函数选出能被转成Int的字符串
*/
let strArray = ["li", "8", "98", "kjidnf"]
print(strArray)
let numberArr = strArray.filter{
    Int($0) != nil
}
print(numberArr)

/*
（3）    用reduce函数把String数组中元素连接成一个字符串，以逗号分隔
*/
let strArray1 = ["li", "8", "", "kjidnf",""]
print(strArray1)
var theString = strArray1.reduce(""){
    if $0 == ""{
        return $1
    }else if $1 == ""{
        return $0
    }else{
        return $0 + "," + $1
    }
}
print(theString)



/*
（4）    用 reduce 方法一次求出整数数组的最大值、最小值、总数和
*/
let intArray = [12,55,-88,22,168,1]
print(intArray)
//最大值
let maxValue = intArray.reduce(intArray[0],{
    return $0 > $1 ? $0 : $1
})
print("最大值为\(maxValue)")
//最小值
let minValue = intArray.reduce(intArray[0],{
    return $0 < $1 ? $0 : $1
})
print("最小值为\(minValue)")
//总数和
let sum = intArray.reduce(0,{
    return $0 + $1
})
print("和为\(sum)")



/*
（5）    新建一个函数数组，函数数组里面保存了不同函数类型的函数，
要求从数组里找出参数为一个整数，返回值为一个整数的所有函数；
*/
func func1(a: Int) -> Int{
    return 1
}
func func2(b: String) -> Int{
    return 1
}
func func3(c: Float) -> Int{
    return 1
}
func func4(d: Int) -> Int{
    return 2
}
var funcArray = [func1,func2,func3,func4] as [Any]
print(funcArray)
var theFunc = funcArray.filter(){
    $0 is (Int) -> Int
}
print(theFunc as! [(Int) -> Int])


/*
（6）    扩展Int，增加sqrt方法，可以计算Int的Sqrt值并返回浮点数，进行验证；
*/
extension Int{
    func sqrt() -> Double{
        return Darwin.sqrt(Double(self))
    }
}
print(sqrt(9))


/*
（7）    实现一个支持泛型的函数，该函数接受任意个变量并返回最大和最小值，
分别传入整数值、浮点数值、字符串进行验证。
*/
protocol Addable {
    static func < (x: Self, y: Self) -> Bool
    static func > (x: Self, y: Self) -> Bool
}
func searchMaxAndMin<T: Addable>(data: [T]) -> (max:T,min:T) {
    var max = data[0]
    var min = data[0]
    for i in data {
        if max < i {
            max = i
        }else if min > i{
            min = i
        }
    }
    return (max,min)
}
extension Int: Addable {}
extension Double: Addable {}
extension Float: Addable {}
extension String: Addable {}

let tempInt = searchMaxAndMin(data:[8,10,9,11])
print("传入整数时最大值为：\(tempInt.max) 最小值为：\(tempInt.min)")
let tempFloat = searchMaxAndMin(data:[11.0,2.0,5.0,7.0])
print("传入浮点数时最大值为：\(tempFloat.max) 最小值为：\(tempFloat.min)")
let tempString = searchMaxAndMin(data:["X","Y","Z"])
print("传入字符串时：最小为: \(tempString.min) 最大为: \(tempString.max)")



/*
（8）    掌握版本控制git的进阶使用
a)    git reset  恢复到之前修改的版本；
b)    git log  看提交记录；
c)    git branch  新建分支；
d)    git checkout  切换分支；
e)    git branch -d  删除分支；
*/







/*
l    作业2:（枚举、类、派生、协议）(红色字体为新增内容)
（1）    实现Person类：
a)    要求具有firstName,  lastName，age，gender等存储属性,fullName计算属性；其中gender是枚举类型（male，female）；
b)    具有指定构造函数和便利构造函数；
c)    两个Person实例对象可以用==和!=进行比较；
d)    Person实例可以直接用print输出；
e)    Person增加run方法(方法里面直接print输出Person XXX is running;
（2）    从Person分别派生Teacher类和Student类：
a)    Teacher类增加属性title，实例可以直接用print输出；
b)    Student类增加属性stuNo，实例可以直接用print输出；
c)    Teacher和Student重载run方法(方法里面直接print输出Teacher XXX is running和Student XXX is running)
（3）    分别构造多个Person、Teacher和Student对象，并将这些对象存入同一个数组中；
（4）    新建一个协议SchoolProtocol，协议包括一个department属性(Enum，自己实现enum的定义)和lendBook方法（随便写点内容，能区隔即可）；
（5）    修改Teacher和Student，让这两个类实现该协议；
（6）    对数组执行以下要求：
a)    分别统计Person、Teacher和Student对象的个数并放入一字典中，统计完后输出字典内容；
b)    对数组按以下要求排序并输出：age、fullName、gender+age；
c)    对数组进行穷举，调用每个对象的run方法，同时调用满足协议SchoolProtocol对象的lendBook方法；
*/
