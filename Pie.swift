//
//  Pie.swift
//  Memorize
//
//  Created by Ibrahim Abdul Aziz on 19/12/2021.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAndle: Angle
    var clockwise = false
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.x + radius * CGFloat(cos(startAngle.radians))
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAndle,
            clockwise: !clockwise
            )
        p.addLine(to: center)
        
        return p
    }
    
    
}

