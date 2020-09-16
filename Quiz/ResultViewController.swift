//
//  ResultViewController.swift
//  Quiz
//
//  Created by 小林玲衣奈 on 2020/09/15.
//  Copyright © 2020 Reina Kobayashi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //正解数
    var correctAnswer: Int = 0
    
    //結果を表示するラベル
    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func back(){
        
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
