//
//  ViewController.swift
//  DYQiniuUpload
//
//  Created by service@qnniu.com on 01/10/2019.
//  Copyright (c) 2019 service@qnniu.com. All rights reserved.
//

import UIKit
import DYQiniuUpload

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func uploadFile() {
        DYQiniuUpload.updateQiNiu(withAccessKey: "xxx", secretKey: "xxx", scope: "xxx", zone: .zone0, key: "xxx", uploadFilePath: "xxx") { (success, resp) in
            
        }
    }

}

