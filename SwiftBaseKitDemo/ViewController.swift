//
//  ViewController.swift
//  SwiftBaseKitDemo
//
//  Created by lax on 2022/9/28.
//

import UIKit
import SwiftBaseKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(UIDevice.current.desc, Bundle.main.desc)
        
        let label = LongPressCopyLabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        label.text = "copy"
        view.addSubview(label)
        
        label.copyClosure = { text in
            print(text ?? "")
        }
    }

}

