//
//  UIView+ColorOfPoint.swift
//  CYKit
//
//  Created by ChenYun on 2017/1/31.
//  Copyright © 2017 ChenYun. All rights reserved.
//

import UIKit

extension UIView {
    func colorOfPoint(point:CGPoint) -> UIColor{
        return UIView.colorOfPoint(point: point, view: self)
    }
    
    class func colorOfPoint(point:CGPoint,view:UIView) -> UIColor{
        var pixel = [CUnsignedChar](repeating: 0, count: 4)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        guard let context = CGContext(data: &pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue).rawValue) else {
            return UIColor.clear
        }
        
        context.translateBy(x: -point.x, y: -point.y)
        view.layer.render(in: context)
        let color = UIColor(red: CGFloat(pixel[0])/255.0, green: CGFloat(pixel[1])/255.0, blue: CGFloat(pixel[2])/255.0, alpha: CGFloat(pixel[3])/255.0)
        return color
    }
}
