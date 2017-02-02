//
//  AnnularSectorView.swift
//  CYKit
//
//  Created by ChenYun on 2017/2/2.
//  Copyright © 2017 ChenYun. All rights reserved.
//

import UIKit

class AnnularSectorView: UIView {
    
    let numberOfSectors = 4
    let startAngle = CGFloat.pi / 8
    let lineWidth:CGFloat = 35.0
    let colors:[UInt] = [0x78c06e,0xa46ec0,0xf8c027,0x72b3d3,0xed6157]
    var radian:CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customInit()
    }
    
    func customInit() {
        self.backgroundColor = UIColor.clear
        self.radian = (CGFloat.pi - startAngle * 2) / CGFloat(numberOfSectors)
    }
    
    override func draw(_ rect: CGRect) {
        for index in 0...numberOfSectors - 1 {
            let _startAngle = CGFloat.pi + self.startAngle + radian * CGFloat(index)
            let _endAngle = _startAngle + radian
            
            let path =  UIBezierPath(arcCenter: CGPoint(x: rect.width / 2.0, y: rect.height), radius: rect.width / 2.0 - lineWidth / 2, startAngle: _startAngle, endAngle: _endAngle, clockwise: true)
            path.lineWidth = lineWidth
            UIColor.colorFromHEX(rgbValue: colors[index%colors.count]).set()
            path.stroke()
        }
    }
}

extension UIColor {
    class func colorFromHEX(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
