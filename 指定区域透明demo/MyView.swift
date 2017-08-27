//
//  MyView.swift
//  指定区域透明demo
//
//  Created by karl on 2017/08/27.
//  Copyright © 2017年 Karl. All rights reserved.
//

import UIKit

/* 三种方式 */

class MyView: UIView {

  let button = UIButton(frame: CGRect(x: 300, y: 100, width: 30, height: 15))
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.isOpaque = false
    
    button.setTitle("点击", for: .normal)
    button.setTitleColor(UIColor.black, for: .normal)
    button.backgroundColor = UIColor.blue
    button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    addSubview(button)
    
//    func3(frame)
  }

  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
//    func1(rect)
    func2(rect)
  }
  
  
  func func1(_ rect: CGRect) {
    UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).setFill()
    UIRectFill(rect)
    
    let holeRect = CGRect(x: button.frame.origin.x - 5, y: button.frame.origin.y - 5, width: button.frame.size.width + 10, height: button.frame.size.height + 10)
    let intersectionRect = holeRect.intersection(rect)
    UIColor.clear.setFill()
    UIRectFill(intersectionRect)
  }
  
  
  func func2(_ rect: CGRect) {
    let holeRect = CGRect(x: button.frame.origin.x - 5, y: button.frame.origin.y - 5, width: button.frame.size.width + 10, height: button.frame.size.height + 10)
    let context = UIGraphicsGetCurrentContext()
    UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).set()
    context?.addRect(rect)
    context?.fillPath()
    context?.setBlendMode(.clear)
//    context?.addEllipse(in: holeRect)
    context?.addRect(holeRect)
    context?.fillPath()
  }
  
  func func3(_ rect: CGRect) {
    let path = UIBezierPath(roundedRect: rect, cornerRadius: 0)
    
    let holeRect = CGRect(x: button.frame.origin.x - 5, y: button.frame.origin.y - 5, width: button.frame.size.width + 10, height: button.frame.size.height + 10)
    
    let holePath = UIBezierPath(ovalIn: holeRect)
    path.append(holePath)
    
    path.usesEvenOddFillRule = true
    
    let shaprLayer = CAShapeLayer()
    shaprLayer.path = path.cgPath
    shaprLayer.fillRule = kCAFillRuleEvenOdd
    shaprLayer.fillColor = UIColor.black.cgColor
    shaprLayer.opacity = 0.5
    self.layer.addSublayer(shaprLayer)
  }

  

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
