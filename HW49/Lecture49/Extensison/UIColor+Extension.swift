//
//  UIColor+Extension.swift
//  Lecture49
//
//  Created by Nika Kirkitadze on 6/25/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
public extension UIView {
    
    private static let kLayerNameGradientBorder = "GradientBorderLayer"
    
    public func setGradientBorder(
        width: CGFloat,
        colors: [UIColor],
        startPoint: CGPoint = CGPoint(x: 0.5, y: 0),
        endPoint: CGPoint = CGPoint(x: 0.5, y: 1)
    ) {
        let existedBorder = gradientBorderLayer()
        let border = existedBorder ?? CAGradientLayer()
        border.frame = bounds
        border.colors = colors.map { return $0.cgColor }
        border.startPoint = startPoint
        border.endPoint = endPoint
        
        let mask = CAShapeLayer()
        mask.path = UIBezierPath(roundedRect: bounds, cornerRadius: 0).cgPath
        mask.fillColor = UIColor.clear.cgColor
        mask.strokeColor = UIColor.white.cgColor
        mask.lineWidth = width
        
        border.mask = mask
        
        let exists = existedBorder != nil
        if !exists {
            layer.addSublayer(border)
        }
    }
    
    public func removeGradientBorder() {
        self.gradientBorderLayer()?.removeFromSuperlayer()
    }
    
    private func gradientBorderLayer() -> CAGradientLayer? {
        let borderLayers = layer.sublayers?.filter { return $0.name == UIView.kLayerNameGradientBorder }
        if borderLayers?.count ?? 0 > 1 {
            fatalError()
        }
        return borderLayers?.first as? CAGradientLayer
    }
}


struct user{
    let image:UIImage
    let name:String
}


class arrayClass{
    static func fillArray() -> [user]{
        var myArray = [user]()
        let erti = user(image: UIImage(named: "1")!, name: "Surati 1")
        let ori = user(image: UIImage(named: "2")!, name: "Surati 2")
        let sami = user(image: UIImage(named: "3")!, name: "Surati 3")
        let otxi = user(image: UIImage(named: "4")!, name: "Surati 4")
        let xuti = user(image: UIImage(named: "5")!, name: "Surati 5")
        let eqvsi = user(image: UIImage(named: "6")!, name: "Surati 6")
        let shvidi = user(image: UIImage(named: "7")!, name: "Surati 7")
        let rva = user(image: UIImage(named: "2")!, name: "Surati 8")
        let cxra = user(image: UIImage(named: "2")!, name: "Surati 9")
        
        myArray.append(erti)
        myArray.append(ori)
        myArray.append(sami)
        myArray.append(otxi)
        myArray.append(xuti)
        myArray.append(eqvsi)
        myArray.append(shvidi)
        myArray.append(rva)
        myArray.append(cxra)

        return myArray
    }
}
