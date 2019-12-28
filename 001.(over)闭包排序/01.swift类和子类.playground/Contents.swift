import UIKit

 
//（1）    找出从1-10000的所有质数，将找出的质数存入可变数组，对数组进行正反排序并输出结果(采用5种以上的方法实现)；
var arr = [Int]()
for i in 2...10000{
    var flag = 0
    for j in 2..<i{
        if i == 2{
            print("j的值：\(j)")
        }
        if i % j == 0{
            flag = 1
            break;
        }
    }
    if flag == 0{
        print(i)
        arr.append(i)
    }
}
print(arr)


//--1.排序(闭包函数)
//-------1.1 降序
func changeDesc(varA: Int, varB: Int) -> Bool{
    return varA > varB
}
arr.sort(by: changeDesc)
print("1，降序排列为：\(arr)\n")
//-------1.2 升序
func changeAsc(_ varA: Int,_ varB: Int) -> Bool{
    return varA < varB
}
arr.sort(by: changeAsc)
print("1，升序排列为：\(arr)\n")


//--2.排序（内联闭包表达式）
//--------2.1 降序
arr.sort(by: {(varA: Int, varB: Int) -> Bool in
    return varA > varB
})
print("2，降序排列为：\(arr)\n")
//--------2.2 升序
arr.sort(by:{(varA: Int, varB: Int) -> Bool in
    return varA < varB
})
print("2, 升序排列为：\(arr)\n")


//--3.排序（根据上下文推断类型）
//----------3.1 降序
arr.sort(by: {varA, varB in
    return varA > varB
})
print("3.降序排列为: \(arr)\n")
//----------3.2 升序
arr.sort(by: {varA, varB in return varA < varB})
print("3.升序排列为：\(arr)\n")


//--4.排序（单表达式闭包隐式返回，省略return）
//----------4.1 降序
arr.sort(by: {varA, varB in varA > varB})
print("4.降序排列为：\(arr)\n")
//----------4.2 升序
arr.sort(by: {varA, varB in varA < varB})
print("4.升序排列为：\(arr)\n")


//--5.排序（参数名称缩写）
//----------5.1 降序
arr.sort(by: {$0 > $1})
print("5.降序排列为：\(arr)\n")
//----------5.2 升序
arr.sort(by: {$0 > $1})
print("5.升序排列为：\(arr)\n")


//--6.排序（运算符方法）
//----------6.1 降序
arr.sort(by:>)
print("6.降序排列为：\(arr)\n")
//----------6.2 升序
arr.sort(by:<)


//--7.排序（尾随闭包--函数调用作为最后一个参数传递给函数）
//----------7.1 降序
arr.sort(){$0 > $1}
print("7.降序排列为：\(arr)\n")
//----------7.2 升序
arr.sort{$0 < $1}   //当闭包表达式是函数唯一的参数时，可以省略（）
print("7.升序排列为：\(arr)\n")


//--8.自定义的排序函数
func mySort<T>(myArray: [T],compare: (T,T) -> Bool) -> [T]{  //冒泡排序
    var myarr = myArray
    for i in 0..<myarr.count{
        for j in 0..<(myarr.count - i - 1){
            if !compare(myarr[j],myarr[j + 1]){
                let temp = myarr[j]
                myarr[j] = myarr[j + 1]
                myarr[j + 1] = temp
            }
        }
        print(myarr[myarr.count - i - 1])
    }
    return myarr
}
//----------8.1 降序
print(mySort(myArray: arr){$0 > $1})
//----------8.2 升序
print(mySort(myArray: arr, compare: {$0 > $1}))

