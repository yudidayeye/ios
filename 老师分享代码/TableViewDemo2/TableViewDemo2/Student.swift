//
//  Student.swift
//  TableViewDemo2
//
//  Created by liguiyang on 2019/11/6.
//  Copyright © 2019 20191102. All rights reserved.
//

import Foundation
class Person {
    var name: String
    var age: Int
    var gender: Bool
    init(name:String = "lgy", age: Int = 18, gender: Bool = true) {
        self.name = name
        self.age = age
        self.gender = gender
    }
}

class Student: Person {
    var grade :String
    init(name:String = "lgy", age: Int = 18, gender: Bool = true, grade: String = "大一") {
        self.grade = grade
        super.init(name: name, age: age, gender: gender)
    }
}
