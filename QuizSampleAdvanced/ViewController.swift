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
        // このViewControllerが制御する画面が生成されたときに1度呼ばれる
        setUpQuiz()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // このViewControllerが制御する画面が表示される度に呼ばれる
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
        let quiz3 = (text: "かける、の演算子は*である", answer: 1, point: 10)
        let quiz4 = (text: "iOSシミュレータを起動してアプリを確認するショートカットキーは、CommandキーとRキーである", answer: 1, point: 10)
        
        // quizArrayに追加していく
        quizArray.append(quiz0)
        quizArray.append(quiz1)
        quizArray.append(quiz2)
        quizArray.append(quiz3)
        quizArray.append(quiz4)
    }

    func updateQuizText() {
        // .countは配列の要素の"個数"を取得するので、0から数えている普通の数字とズレるので1を引く
        if quizNumber == quizArray.count - 1 {
            
            // 問題が終わったら結果をアプリ内に保存
            let userDefaults = UserDefaults.standard
            userDefaults.set(point, forKey: "point")
            userDefaults.synchronize()
            
            // 結果表示
            self.performSegue(withIdentifier: "toResult", sender: nil)
        } else {
            // 更新
            quizNumber = quizNumber + 1
            quizTextView.text = quizArray[quizNumber].0
        }
    }
    
    func resetResult() {
        // シャッフル
        shuffleQuiz()
        
        // 結果をリセット
        quizNumber = 0
        point = 0
        quizTextView.text = quizArray[quizNumber].0
    }
    
    // シャッフル機能
    func shuffleQuiz() {
        var shuffledQuizArray: [(String, Int, Int)] = []
        for _ in 0..<quizArray.count {
            let index = Int(arc4random_uniform(UInt32(quizArray.count)))
            shuffledQuizArray.append(quizArray[index])
            quizArray.remove(at: index)
        }
        quizArray = shuffledQuizArray
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
    
}

