//
//  ViewController.swift
//  QuizSampleAdvanced
//
//  Created by Masuhara on 2016/11/26.
//  Copyright © 2016年 net.masuhara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var quizNumber: Int = 0
    var point: Int = 0
    var quizArray: [(String, Int, Int)] = []

    @IBOutlet var quizTextView: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpQuiz()
        resetResult()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpQuiz() {
        // タプルを使って複数の情報をひとまとめにする
        let quiz0 = (text: "Int型は整数を扱うための型である", answer: 1, point: 10)
        let quiz1 = (text: "String型は小数点付きの数値を扱うための型である", answer: 0, point: 10)
        let quiz2 = (text: "プログラミングにおける=(イコール)は代入の意味を持つ", answer: 1, point: 10)
        let quiz3 = (text: "かける、の演算子は×である", answer: 0, point: 10)
        let quiz4 = (text: "iOSシミュレータを起動してアプリを確認するショートカットキーは、CommandキーとRキーである", answer: 1, point: 10)
        
        // quizArrayに追加していく
        quizArray.append(quiz0)
        quizArray.append(quiz1)
        quizArray.append(quiz2)
        quizArray.append(quiz3)
        quizArray.append(quiz4)
    }

    func updateQuizText() {
        if quizNumber == quizArray.count - 1 {
            // 結果表示
            showResult()
        } else {
            // 更新
            quizNumber = quizNumber + 1
            quizTextView.text = quizArray[quizNumber].0
        }
    }
    
    @IBAction func tappedMaru() {
        // 各問題で正解の選択肢で◯を選んだ場合に得点を付ける
        if quizArray[quizNumber].1 == 1 {
            point = point + quizArray[quizNumber].2
        } else {
            point = point - quizArray[quizNumber].2
        }
        
        // 問題文を更新
        updateQuizText()
    }
    
    @IBAction func tappedBatsu() {
        // 各問題で正解の選択肢で✕を選んだ場合に得点を付ける
        if quizArray[quizNumber].1 == 0 {
            point = point + quizArray[quizNumber].2
        } else {
            point = point - quizArray[quizNumber].2
        }
        
        // 問題文を更新
        updateQuizText()
    }

    func showResult() {
        // アラートで結果を表示
        let alert = UIAlertController(title: "結果", message: "\(point)点でした", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action in
            self.resetResult()
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func resetResult() {
        // 結果をリセット
        self.quizNumber = 0
        self.point = 0
        quizTextView.text = quizArray[quizNumber].0
    }

}

