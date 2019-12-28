//
//  Teacher.swift
//  myTableView
//
//  Created by lijin on 2019/11/12.
//  Copyright © 2019 lijin. All rights reserved.
//

import Foundation
class Teacher: Person {
    var major:String
    init(name:String,age:Int,gender:Bool,major:String) {
        self.major = major
        super.init(name: name, age: age, gender: gender)
    }
}
