import UIKit

//1. 定一个协议(XXXShapeProtocol)(XXX 表示自己的姓名简写)，具体要求:
//a) 存储属性:date{get set}(对象创建时间)
//b) 计算属性:perimeter {get}(周长)
protocol LjShapeProtocol {
    var data: Date { get set }
    var perimeter: Double { get }
}

//2. 新建一个类 XXXCircle(实现协议 XXXShapeProtocol)，具体要求:
//a) 私有属性半径 radius;
//b) 重载计算属性 perimeter(利用圆的周长公式计算并返回当前圆的实际周长);
//c) 具有构造函数;  
//d) 实例可以直接用 print 输出(输出自己的形状、周长和创建时间);  
class LjCircle:LjShapeProtocol,CustomStringConvertible,Codable{
    var radius: Double = 0.5
    var data: Date = Date()
    var perimeter: Double{
        return 2 * 3.14 * radius
    }
    init(radius: Double) {
        self.radius = radius
    }
    var description: String{
        return "这是一个圆，半径为:\(radius),周长为\(perimeter)，创建时间为\(data)"
    }
}
var circle1 = LjCircle(radius: 1.0)
print(circle1)

//3. 类的使用:
//a) 构造多个 XXXCircle 的对象，并将对象存入一个数组中;
//b) 用 filter 闭包选出 perimeter 在某个范围内的对象数组;
//c) 对筛选出的数组进行排序并输出排序后结果(按 perimeter 从小到大);
var circle2 = LjCircle(radius: 1.4)
var circle3 = LjCircle(radius: 2.0)
var circle4 = LjCircle(radius: 1.5)
var circle5 = LjCircle(radius: 3.0)
var circle6 = LjCircle(radius: 1.1)
var circle7 = LjCircle(radius: 2.0)
var circleArray = [circle1,circle2,circle3,circle4,circle5,circle6,circle7]
print(circleArray)
var resultArray = circleArray.filter{ return $0.perimeter < 10 }
print(resultArray)
resultArray.sort{
    $0.perimeter < $1.perimeter
}
print(resultArray)

//4. 沙盒文件操作
//a) 将排序后的数组保存到沙盒 Document 文件夹下以自己姓名命名的一文件中;
//b) 从文件中恢复一个新的数组，并打印数组;
let fm = FileManager.default
if var urlPath = fm.urls(for: .documentDirectory, in: .userDomainMask).first{
    print(urlPath.path)
    print(urlPath.path)
    urlPath.appendPathComponent("lijin.txt")
    let encoder = JSONEncoder()
    let decode = JSONDecoder()
    let data = try encoder.encode(circleArray)
    try data.write(to: urlPath)
    let data1 = try Data.init(contentsOf: urlPath)
    let arr1 = try decode.decode(type(of: circleArray), from: data1)
    print(arr1)
}
//print(urlPat h.path)
//print(urlPath)
//urlPath.appendPathComponent("lijin.txt")
//let encoder = JSONEncoder()
//let decode = JSONDecoder()
//let data = try encoder.encode(circleArray)
//try data.write(to: urlPath)
//let data1 = try Data.init(contentsOf: urlPath)
//let arr1 = try decode.decode(type(of: circleArray), from: data1)
//print(arr1
