//
//  ViewController.swift
//  guessNumber
//
//  Created by 董禾翊 on 2022/9/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lifeLable: UILabel!
    @IBOutlet weak var guessNumberTextField: UITextField!
    @IBOutlet weak var showResult: UILabel!
    @IBOutlet weak var GO: UIButton!
    var answer = Int.random(in: 1...99)
    var min = 0
    var max = 100
    var life = 6
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showResult.text = "請輸入\(min)~\(max)之間的數字"
        lifeLable.text = "\(life)"
    }
    @IBAction func goBtn(_ sender: Any) {
        let guessNumber = Int(guessNumberTextField.text!)
        if guessNumber != nil{
            if guessNumber! == answer{
                showResult.text = "太強了！"
                GO.isEnabled = false
                guessNumberTextField.isEnabled = false
            }else if guessNumber! < answer{
                min = guessNumber!
                showResult.text = "太小了，再試試，請輸入\(min)~\(max)之間的數字"
                guessNumberTextField.text = ""
            }else{
                max = guessNumber!
                showResult.text = "太大了，再試試，請輸入\(min)~\(max)之間的數字"
                guessNumberTextField.text = ""
            }
            life -= 1
            if life == 0, guessNumber! != answer{
                lifeLable.text = "\(life)"
                showResult.text = "芭比Ｑ了～Game Over～"
                guessNumberTextField.isEnabled = false
                GO.isEnabled = false
            }else{
                lifeLable.text = "\(life)"
            }
        }
    }
    
    @IBAction func replayBtn(_ sender: Any) {
        guessNumberTextField.isEnabled = true
        GO.isEnabled = true
        life = 6
        lifeLable.text = "\(life)"
        answer = Int.random(in: 1...99)
        showResult.text = ""
        guessNumberTextField.text = ""
        min = 0
        max = 100
        showResult.text = "請輸入\(min)~\(max)之間的數字"
    }
    
}

