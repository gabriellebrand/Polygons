//
//  View.swift
//  CollectionViewChallenge2
//
//  Created by Gabrielle Brandenburg dos Anjos on 3/11/16.
//  Copyright © 2016 Gabrielle Brandenburg dos Anjos. All rights reserved.
//

import UIKit
import Foundation

func polygonPointArray(_ sides:Int,x:CGFloat,y:CGFloat,radius:CGFloat,offset:CGFloat)->[CGPoint] {
    let angle = (360/CGFloat(sides)).radians()
    let cx = x // x origin
    let cy = y // y origin
    let r = radius // radius of circle
    var i = 0
    var points = [CGPoint]()
    while i <= sides {
        let xpo = cx + r * cos(angle * CGFloat(i) - offset.radians())
        let ypo = cy + r * sin(angle * CGFloat(i) - offset.radians())
        points.append(CGPoint(x: xpo, y: ypo))
        i += 1
    }
    return points
}

func polygonPath(_ x:CGFloat, y:CGFloat, radius:CGFloat, sides:Int, offset: CGFloat) -> CGPath {
    let path = CGMutablePath()
    let points = polygonPointArray(sides, x: x, y: y,radius: radius, offset: offset)
    let cpg = points[0]
    
    path.move(to: cpg)
    
    for p in points {
        path.addLine(to: p)
        //CGPathAddLineToPoint(path, nil, p.x, p.y)
    }
    path.closeSubpath()
    return path
}

func drawPolygonBezier(_ x:CGFloat, y:CGFloat, radius:CGFloat, sides:Int, color:UIColor, offset:CGFloat) -> UIBezierPath {
    let path = polygonPath(x, y: y, radius: radius, sides: sides, offset: offset)
    let bez = UIBezierPath(cgPath: path)
    // no need to convert UIColor to CGColor when using UIBezierPath
    color.setFill()
    bez.fill()
    return bez
}

func drawPolygonUsingPath(_ ctx:CGContext, x:CGFloat, y:CGFloat, radius:CGFloat, sides:Int, color:UIColor, offset:CGFloat) {
    let path = polygonPath(x, y: y, radius: radius, sides: sides, offset: offset)
    ctx.addPath(path)
    let cgcolor = color.cgColor
    ctx.setFillColor(cgcolor)
    ctx.fillPath()
}

class polygonView: UIView {

    var sides = 0
    
    override func draw(_ rect:CGRect)
        
    {
        let ctx = UIGraphicsGetCurrentContext()

        drawPolygonBezier(rect.midX, y: rect.midY, radius: rect.width/3, sides: sides, color: UIColor.randomColor(), offset:0)

        
    }

}
