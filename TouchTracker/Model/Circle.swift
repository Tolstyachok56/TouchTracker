//
//  Circle.swift
//  TouchTracker
//
//  Created by Виктория Бадисова on 04.06.2018.
//  Copyright © 2018 Виктория Бадисова. All rights reserved.
//

import Foundation
import CoreGraphics

struct Circle {
    var rect = CGRect.zero
    
    init(_ points: [CGPoint]) {
        let point1 = points[0]
        let point2 = points[1]
        
        let width = abs(point1.x - point2.x)
        let height = abs(point1.y - point2.y)
        
        let diameter = max(width, height)
        let radius = diameter / 2
        let center = CGPoint(x: (point1.x + point2.x) / 2, y: (point1.y + point2.y) / 2)
        
        rect = CGRect(x: center.x - radius, y: center.y - radius, width: diameter, height: diameter)
    }
}
