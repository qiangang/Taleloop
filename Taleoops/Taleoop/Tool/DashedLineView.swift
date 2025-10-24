//
//  DashedLineView.swift
//  Taleoop
//
//  Created by Ben on 26/5/2025.
//

import UIKit

class DashedLineView: UIView {
    
    var lineColor: UIColor = isColors(0xCD873C)
    var lineWidth: CGFloat = 2.0
    var dashPattern: [CGFloat] = [5, 5]
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setStrokeColor(lineColor.cgColor)
        context.setLineWidth(lineWidth)
        context.setLineDash(phase: 0, lengths: dashPattern)
        context.beginPath()
        context.move(to: CGPoint(x: 0, y: rect.midY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        context.strokePath()
    }
}
