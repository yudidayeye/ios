//
//  Student.swift
//  myTableView
//
//  Created by lijin on 2019/11/12.
//  Copyright © 2019 lijin. All rights reserved.
//

import Foundation
class  Student:Person {
    var stuClass:String
    init(name:String,age:Int,gender:Bool,stuClass:String) {
        self.stuClass = stuClass
        super.init(name: name, age: age, gender: gender)
    }
}
