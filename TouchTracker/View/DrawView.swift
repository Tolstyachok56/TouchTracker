//
//  DrawView.swift
//  TouchTracker
//
//  Created by Виктория Бадисова on 04.06.2018.
//  Copyright © 2018 Виктория Бадисова. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var currentCircle: Circle?
    var finishedCircles = [Circle]()
    var circleTouches = [NSValue: CGPoint]()
    
    @IBInspectable var finishedLineColor: UIColor = .black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var currentLineColor: UIColor = .red {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var lineThickness: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    func stroke(_ circle: Circle) {
        let path = UIBezierPath(ovalIn: circle.rect)
        path.lineWidth = lineThickness
        path.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        finishedLineColor.setStroke()
        for circle in finishedCircles {
            stroke(circle)
        }
        
        currentLineColor.setStroke()
        if let circle = currentCircle {
            stroke(circle)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count == 2 {
            for touch in touches {
                let key = NSValue(nonretainedObject: touch)
                circleTouches[key] = touch.location(in: self)
            }
            currentCircle = Circle.init(Array(circleTouches.values))
        }
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count == 2, let _ = currentCircle {
            for touch in touches {
                let key = NSValue(nonretainedObject: touch)
                circleTouches[key] = touch.location(in: self)
            }
            currentCircle = Circle.init(Array(circleTouches.values))
        }
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count == 2, let _ = currentCircle {
            for touch in touches {
                let key = NSValue(nonretainedObject: touch)
                circleTouches[key] = touch.location(in: self)
            }
            currentCircle = Circle.init(Array(circleTouches.values))
            finishedCircles.append(currentCircle!)
            circleTouches.removeAll()
            currentCircle = nil
        }
        setNeedsDisplay()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentCircle = nil
        circleTouches.removeAll()
        setNeedsDisplay()
    }
    
}
