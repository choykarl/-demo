//
//  ViewController.swift
//  指定区域透明demo
//
//  Created by karl on 2017/08/27.
//  Copyright © 2017年 Karl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let imageView = UIImageView()
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.frame = view.bounds
    imageView.image = UIImage(named: "广场")
    imageView.contentMode = .scaleAspectFit
    view.addSubview(imageView)
    
    
    let v = MyView(frame: view.bounds)
    view.addSubview(v)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

