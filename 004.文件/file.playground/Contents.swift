import UIKit
import Foundation

var 👌😊: String? = nil
👌😊 = "test"
var 房子数 = 1
房子数 = 10

"      中文👌😊国庆节       ".trimmingCharacters(in: .whitespaces).count
let str = "here the that"
let range = str.range(of: "the")

let str1 = str[str.index(str.startIndex, offsetBy: 3)...str.index(str.startIndex, offsetBy: 7)]

let date = Date()
let dateFormatter = DateFormatter()
dateFormatter.locale = Locale(identifier: "zh_CN")
dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss a"

print(dateFormatter.string(from: date))
dateFormatter.timeZone = TimeZone(secondsFromGMT: -3*3600)
print(dateFormatter.string(from: date))

dateFormatter.calendar = Calendar(identifier: .chinese)
dateFormatter.dateFormat = "U年MM月dd EEEE hh:mm:ss a"
print(dateFormatter.string(from: date))


print(Bundle.main.bundlePath)


class Student: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool { return true }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(age, forKey: "age")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.age = aDecoder.decodeInteger(forKey: "age")
    }
    
    var name: String
    var age: Int
    init(name:String,age:Int) {
        self.name = name
        self.age = age
    }
    
    override var description: String {
        return "name:\(name) age:\(age)"
    }
}

let s1 = Student(name: "lgy", age: 44)
//-------------------------------------------
class Person: Codable {
    var name: String
    var age: Int
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}

let p1 = Person(name: "gyx", age: 45)
let p2 = Person(name: "fxk", age: 40)
let arr = [p1,p2]


let fm = FileManager.default
if var urlPath = fm.urls(for: .documentDirectory, in: .userDomainMask).first {
    print(urlPath.path)
    print(urlPath)
    urlPath.appendPathComponent("test.txt")
    do {
//        try str.write(to: urlPath, atomically: true, encoding: .utf8)
//
//        let str2 = try String(contentsOf: urlPath)
//        print(str2)
//        let data = try NSKeyedArchiver.archivedData(withRootObject: s1, requiringSecureCoding: true)
//
//        try data.write(to: urlPath)
//
//        let data2 = try Data(contentsOf: urlPath)
//
//        let s2 = try NSKeyedUnarchiver.unarchivedObject(ofClass: Student.self, from: data2)
//        print(s2!)
        
        let encoder = JSONEncoder()
        let decode = JSONDecoder()
        
        let data = try encoder.encode(arr)
        try data.write(to: urlPath)

    } catch {
        print(error)
    }
}


let url = URL(string: "https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike180%2C5%2C5%2C180%2C60/sign=aaebbb7a1bdfa9ece9235e4503b99c66/eaf81a4c510fd9f98f128c0f2f2dd42a2834a44b.jpg")
let data3 = try Data(contentsOf: url!)
let image = UIImage(data: data3)


if let url = URL(string: "http://t.weather.sojson.com/api/weather/city/101020100") {
    if let data = try? Data(contentsOf: url) {
        if let dict = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] {
            if let city = dict["cityInfo"] as? [String:Any] {
                if let cityName = city["city"] {
                    print(cityName)
                }
            }
        }
    }

}





//4. 沙盒文件操作
//a) 将排序后的数组保存到沙盒 Document 文件夹下以自己姓名命名的一文件中;
//b) 从文件中恢复一个新的数组，并打印数组;
let fm = FileManager.default
if var urlPath = fm.urls(for: .documentDirectory, in: .userDomainMask).first{
    print(urlPath.path)
    print(urlPath)
    urlPath.appendPathComponent("test.txt")
    do{
        let encoder = JSONEncoder()
        let decode = JSONDecoder()
        
        let data = try encoder.encode(circleArray)
        try data.write(to: urlPath)
        
        let data1 = try Data.init(contentsOf: urlPath)
        let arr1 = try decode.decode(type(of: circleArray), from: data1)
        print(arr1)
        
    }catch{
        print(error)
    }
}
