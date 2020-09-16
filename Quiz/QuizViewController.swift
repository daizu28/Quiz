//
//  QuizViewController.swift
//  Quiz
//
//  Created by 小林玲衣奈 on 2020/09/15.
//  Copyright © 2020 Reina Kobayashi. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    //問題文を格納する配列
    var quizArray = [Any]()
    
    //正解数を数えるための変数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //quizArrayに問題文、3つの選択肢、答えの番号が入った配列を追加
        quizArray.append(["Appleの2015年のCEOの名前は？", "スティーブ・ジョブズ", "ティムクック", " ジョナサンアイブ", 2])
        quizArray.append(["画面タッチの指の圧力を検出する機能をなんという？", "3Dタッチ", "4Dタッチ", "スーパータッチ", 1])
        quizArray.append(["iPod touchのモデルの中で最大容量のものは何GB?", "64GB", "128GB", "160GB", 3])
        quizArray.append(["1985年、Appleを追放されたジョブズが立ち上げた会社の名前の正式表記は？", "NEXt,Inc", "NExT,Inc.", "NeXT,Inc.", 3])
        quizArray.append(["2015年9月30日にリリースされたOSXの名前は？", "EL Captain", "El Capitan", "ElCaptital", 2])
        quizArray.append(["Apple WatchはiPhoneとどんな通信方式でペアリングされる？", "FM電波", "Wi-Fi", "Bluetooth", 1])
        
        //問題文をシャッフル
        quizArray.shuffle()
        
        choiceQuiz()

        // Do any additional setup after loading the view.
    }
    
    
    
    func choiceQuiz(){
        //一時的にクイズを取り出しておく配列
        let tmpArray = quizArray[0] as! [Any]
        
        //問題文を表示
        quizTextView.text = tmpArray[0] as? String
        
        //選択肢ボタンにそれぞれの選択肢をセット
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
        
    }
    
    //自動で結果画面にいくようにするためのメソッド
    func performSegueToResult(){
         performSegue(withIdentifier: "toResultView", sender: nil)
         
     }
    
    
    @IBAction func choiceAnswer(sender: UIButton){
        //引数のsender.tagに書くにされているTagの値を使って処理を区別する
        
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag{
            
            //正解数を増やす
            correctAnswer = correctAnswer + 1
        }
        
        //解いた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
        
        //解いた問題の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0{
            performSegueToResult()
        } else {
            choiceQuiz()
        }
        
        
        
    }
    
    
    //セグエを準備(prepare)する時に呼ばれるメソッド
    override func prepare (for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toResultView"{
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
