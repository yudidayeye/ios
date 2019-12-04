//
//  Teacher.swift
//  TableViewDemo2
//
//  Created by liguiyang on 2019/11/6.
//  Copyright © 2019 20191102. All rights reserved.
//

import Foundation
class Teacher: Person {
    var major:String
    init(name:String, age: Int, gender: Bool, major: String) {
        self.major = major
        super.init(name: name, age: age, gender: gender)
    }
}
