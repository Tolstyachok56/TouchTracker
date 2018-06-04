//
//  Line.swift
//  TouchTracker
//
//  Created by Виктория Бадисова on 04.06.2018.
//  Copyright © 2018 Виктория Бадисова. All rights reserved.
//

import Foundation
import CoreGraphics

struct Line {
    var begin = CGPoint.zero
    var end = CGPoint.zero
    
    var angle: Measurement<UnitAngle> {
        let dy = Double(end.y - begin.y)
        let dx = Double(end.x - begin.x)
        var angle: Measurement<UnitAngle> = Measurement(value: -atan2(dy, dx), unit: .radians)
        angle.convert(to: .degrees)
        let angleValue = (angle.value > 0) ? angle.value : (angle.value + 360)
        let res: Measurement<UnitAngle> = Measurement(value: angleValue, unit: .degrees)
        return res
    }
    
}
