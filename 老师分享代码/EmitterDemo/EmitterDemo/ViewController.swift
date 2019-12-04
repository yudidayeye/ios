//
//  ViewController.swift
//  EmitterDemo
//
//  Created by liguiyang on 2019/11/6.
//  Copyright © 2019 liguiyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1
    
    // 2
    func setUpEmitterLayer(point: CGPoint) -> CAEmitterLayer {
        let emitterLayer = CAEmitterLayer()
        emitterLayer.frame = view.bounds
        emitterLayer.seed = UInt32(NSDate().timeIntervalSince1970)
        emitterLayer.renderMode = .additive
        emitterLayer.drawsAsynchronously = true
        emitterLayer.emitterPosition = point
        return emitterLayer
        
    }
    
    @IBAction func clear(_ sender: Any) {
        for layer in view.layer.sublayers ?? [] {
            if layer is CAEmitterLayer {
                layer.removeFromSuperlayer()
            }
        }
    }
    
    // 3
    func setUpEmitterCell() -> CAEmitterCell {
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage(named: "smallStar")?.cgImage
        
        emitterCell.velocity = 10.0
        emitterCell.velocityRange = 500.0
        
        emitterCell.color = UIColor.black.cgColor
        emitterCell.redRange = 1.0
        emitterCell.greenRange = 1.0
        emitterCell.blueRange = 1.0
        emitterCell.alphaRange = 0.0
        emitterCell.redSpeed = 0.0
        emitterCell.greenSpeed = 0.0
        emitterCell.blueSpeed = 0.0
        emitterCell.alphaSpeed = -0.5
        
        let zeroDegreesInRadians = degreesToRadians(0.0)
        emitterCell.spin = degreesToRadians(130.0)
        emitterCell.spinRange = zeroDegreesInRadians
        emitterCell.emissionRange = degreesToRadians(360.0)
        
        emitterCell.lifetime = 1.0
        emitterCell.birthRate = 50.0
        emitterCell.xAcceleration = -100.0
        emitterCell.yAcceleration = 500.0
        
        return emitterCell
    }
    
    func degreesToRadians(_ degrees: Double) -> CGFloat {
        return CGFloat(degrees * Double.pi / 180.0)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let p = touch.location(in: self.view)
            let emitterLayer = setUpEmitterLayer(point: p)
            
            emitterLayer.emitterCells = [setUpEmitterCell()]
            view.layer.addSublayer(emitterLayer)
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
                emitterLayer.removeFromSuperlayer()
            }
            
        }
    }
    
}
