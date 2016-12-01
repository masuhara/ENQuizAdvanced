//
//  ResultViewController.swift
//  QuizSampleAdvanced
//
//  Created by Masuhara on 2016/12/01.
//  Copyright © 2016年 net.masuhara. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var point: Int = 0
    @IBOutlet var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        let point = userDefaults.integer(forKey: "point")
        scoreLabel.text = String(point)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToTop() {
        // Modalで移動した画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }

}
