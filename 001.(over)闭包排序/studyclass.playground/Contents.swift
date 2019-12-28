import UIKit
/*
作业2:（枚举、类、派生）
(1)实现Person类
a)要求具有firstName,  lastName，age，gender等存储属性,fullName计算属性；其中gender是枚举类型（male，female）；
b)具有指定构造函数和便利构造函数；
c)两个Person实例对象可以用==和!=进行比较；
d)Person实例可以直接用print输出；
*/
enum Gender: Int{
    case male
    case female
    static func < (lhs: Gender, rhs: Gender) -> Bool{
        return lhs.rawValue < rhs.rawValue
    }
}

class Person: CustomStringConvertible, Equatable{
    var firstName: String = ""
    var lastName = ""
    var age = 1
    var gender = Gender.male
    var fullName: String{
        get{
            return firstName + lastName
        }
    }
    //构造函数
    init(firstName: String, lastName: String, age: Int, gender: Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    //便利构造函数
    convenience init(firstName: String, lastName: String){
        self.init(firstName: firstName, lastName: lastName, age: 18, gender: Gender.male)
    }
    //Person实例对象可以用==和!=进行比较
    static func == (lhs: Person, rhs: Person) -> Bool{
        return lhs.fullName == rhs.fullName && lhs.age == rhs.age && lhs.gender == rhs.gender
    }
    static func != (lhs: Person, rhs: Person) -> Bool{
        return !(lhs == rhs)
    }
    //直接用print输出
    var description: String{
        return "*Person：全名：\(fullName)   年龄: \(age)   性别: \(gender)\n"
    }
}

//(1)测试
print("\n(1)测试")
var onePerson = Person(firstName: "及", lastName: "等", age: 16, gender: Gender.male)   //指定构造函数
var twoPerson = Person(firstName: "二", lastName: "产生")   //便利构造函数
var threePerson = Person(firstName: "及", lastName: "等")
var fourPerson = Person(firstName: "二", lastName: "产生", age: 18, gender: Gender.male)
print(onePerson)
print(twoPerson)
print(threePerson)
func equal(_ one: Person, _ two: Person){
    if(one == two){
        print("\(one.fullName)和\(two.fullName)为同一个人")
    }else{
        print("\(one.fullName)和\(two.fullName)不为同一个人")
    }
}
equal(onePerson, twoPerson)
equal(onePerson, threePerson)
equal(twoPerson, fourPerson)

/*
(2)从Person分别派生Teacher类和Student类：
a)Teacher类增加属性title，实例可以直接用print输出；
b)Student类增加属性stuNo，实例可以直接用print输出；
*/
class Teacher: Person{
    var title: String = "good"
    //指定构造函数
    init(title:String, firstName: String, lastName: String, age: Int, gender: Gender){
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    //重写父类指定构造函数
    override init(firstName: String, lastName: String, age: Int, gender: Gender){
         super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    //直接用print输出
    override var description: String{
        return "*Teacher：全名：\(fullName)   年龄: \(age)   性别: \(gender)   title: \(title)\n"
    }
}

class Student: Person{
    var stuNo: String = "20170000"
    //指定构造函数
    init(stuNo: String, firstName: String, lastName: String, age: Int, gender: Gender){
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    //直接用print输出
    override var description: String{
        return "*Student：全名：\(fullName)   年龄: \(age)   性别: \(gender)   stuNo: \(stuNo)\n"
    }
}

//(2)测试
print("\n(2)测试")
var p = Person(firstName: "李", lastName: "晋", age: 16, gender:Gender.female)
var p1 = Person(firstName: "金", lastName: "啦啦")
var p2 = Person(firstName: "刘", lastName: "哈")

var t = Teacher(title: "hello",firstName: "张", lastName: "非得", age: 20, gender: Gender.female)
var t1 = Teacher(firstName: "李", lastName: "晋", age: 28, gender:Gender.male)
var t2 = Teacher(firstName: "阳", lastName: "杀")   //当父类的所有指定初始化器实现，父类的便捷初始化器自动继承
var t3 = Teacher(firstName: "光", lastName: "东方")
var t4 = Teacher(firstName: "李", lastName: "憨憨", age: 20, gender:Gender.female)

var s = Student(stuNo: "2017110517",firstName: "何", lastName: "灵", age: 20, gender: Gender.male)
// var s1 = Student(firstName: "李", lastName: "晋")       //未实现父类的指定初始化器，所以便利初始化器未继承
var s1 = Student(stuNo: "2017110617",firstName: "凯", lastName: "好卡", age: 10, gender: Gender.female)
var s2 = Student(stuNo: "2017110517",firstName: "东", lastName: "德", age: 17, gender: Gender.male)

print(p)
print(p1)
print(p2)

print(t)
print(t1)
print(t2)
print(t3)
print(t4)

print(s)
print(s1)
print(s2)


/*
(3)分别构造多个Person、Teacher和Student对象，并将这些对象存入同一个数组中；
*/
print("\n(3)测试")
var personArray: [Person] = [p,t,s,s1,s2]
personArray.append(p1)
personArray.append(p2)
personArray += [t1, t2, t3, t4]
personArray.remove(at: 0)
print(personArray)


/*
(4)对数组执行以下要求：
a)分别统计Person、Teacher和Student对象的个数并放入一字典中，统计完后输出字典内容；
b)对数组按以下要求排序并输出：age、fullName、gender+age；
*/
print("\n(4)测试")
var personDict: [String : Int] = ["Person": 0, "Teacher": 0, "Student": 0]
//统计
for item in personArray{
    if item is Teacher{
        personDict["Teacher"]! += 1
    }else if item is Student{
        personDict["Student"]! += 1
    }else{
        personDict["Person"]! += 1
    }
}
print(personDict)

//排序
//按age排序
personArray.sort(){
    $0.age < $1.age
}
print("----按age排序:\n\(personArray)")
//按fullName排序
personArray.sort(by: {(person1: Person,person2: Person) -> Bool in
    return person1.fullName < person2.fullName
})
print("----按fullName排序:\n\(personArray)")
//按gender+age排序
personArray.sort{
    if $0.gender < $1.gender{
        return true
    }else if $0.gender == $1.gender && $0.age < $1.age{
        return true
    }else{
        return false
    }
}
print("----按gender+age排序:\n\(personArray)")

