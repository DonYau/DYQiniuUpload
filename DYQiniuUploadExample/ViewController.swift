//
//  ViewController.swift
//  DYQiniuUploadExample
//
//  Created by donyau on 2019/4/10.
//  Copyright © 2019 donyau. All rights reserved.
//

import UIKit
import DYQiniuUpload

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    func updateFile() {
        DYQiniuUploadTool .updateQiNiu(withAccessKey: "xxxxx", secretKey: "xxxx", scope: "xxxx", zone: DYQNZoneMode.zone0, key: "xxx", uploadFilePath: "xxx") { (success) in
            
        }
    }
}



