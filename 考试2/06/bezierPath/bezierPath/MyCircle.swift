//
//  MyCircle.swift
//  bezierPath
//
//  Created by student on 2019/11/20.
//  Copyright © 2019 lijin. All rights reserved.
//

import UIKit

class MyCircle: UIView {

    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(arcCenter: CGPoint(x: 100, y: 100), radius: 90, startAngle: 0, endAngle: 360, clockwise: true)
        path.lineWidth = 5
        UIColor.red.setStroke()
        path.stroke()
    }
   

}
