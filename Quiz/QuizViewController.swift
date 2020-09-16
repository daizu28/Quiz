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
    var correctAnser: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //quizArrayに問題文、3つの選択肢、答えの番号が入った配列を追加
        quizArray.append(["問題文1", "選択肢1", "選択肢2", "選択肢3", 2])
        quizArray.append(["問題文2", "選択肢1", "選択肢2", "選択肢3", 1])
        quizArray.append(["問題文3", "選択肢1", "選択肢2", "選択肢3", 3])
        quizArray.append(["問題文4", "選択肢1", "選択肢2", "選択肢3", 3])
        quizArray.append(["問題文5", "選択肢1", "選択肢2", "選択肢3", 2])
        quizArray.append(["問題文6", "選択肢1", "選択肢2", "選択肢3", 1])
        
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
    
    func performSegueToResult(){
         performSegue(withIdentifier: "toResultView", sender: nil)
         
     }
    
    @IBAction func choiceAnswer(sender: UIButton){
        //引数のsender.tagに書くにされているTagの値を使って処理を区別する
        
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag{
            //正解数を増やす
            correctAnser = correctAnser + 1
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
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
