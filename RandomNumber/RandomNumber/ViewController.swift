//
//  ViewController.swift
//  RandomNumber
//
//  Created by Sirichai Binchai on 6/7/2561 BE.
//  Copyright © 2561 Sirichai Binchai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var correctImg: UIImageView!
    @IBOutlet weak var backgroungImg: UIImageView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var statusLB: UILabel!
    @IBOutlet weak var wrongImg: UIImageView!
    @IBOutlet weak var inputNumberTxt: UITextField!
    
    @IBOutlet weak var n1Btn: UIButton!
    @IBOutlet weak var n2Btn: UIButton!
    @IBOutlet weak var n3Btn: UIButton!
    @IBOutlet weak var n4Btn: UIButton!
    @IBOutlet weak var n5Btn: UIButton!
    @IBOutlet weak var n6Btn: UIButton!
    @IBOutlet weak var n7Btn: UIButton!
    @IBOutlet weak var n8Btn: UIButton!
    @IBOutlet weak var n9Btn: UIButton!
    
    var maxNumber = 0
    var strStatus:String = ""
    var randomArray:[Int] = []
    var currentPos = 0
    let pressedColor = UIColor.yellow
    let unPresscolor = UIColor.green
    
    @IBAction func onN1BtnPress(_ sender: UIButton) {
        checkPressNBtn(btnPress: checkWhichBtn(TagBtn: sender.tag), numVal: sender.tag)
    }
    
    func checkWhichBtn(TagBtn:Int) -> UIButton! {
        if TagBtn == 1 {
            return n1Btn
        }else if TagBtn == 2 {
            return n2Btn
        }else if TagBtn == 3 {
            return n3Btn
        }else if TagBtn == 4 {
            return n4Btn
        }else if TagBtn == 5 {
            return n5Btn
        }else if TagBtn == 6 {
            return n6Btn
        }else if TagBtn == 7 {
            return n7Btn
        }else if TagBtn == 8 {
            return n8Btn
        }else if TagBtn == 9 {
            return n9Btn
        }
        return nil
    }

    func checkPressNBtn(btnPress: UIButton, numVal: Int) {
        if randomArray[currentPos] == numVal {
            btnPress.backgroundColor = pressedColor
            btnPress.isEnabled = false
            if currentPos == maxNumber-1 {
                showSucceed()
            } else {
                wrongImg.isHidden = true
                currentPos += 1
            }
        } else {
            btnStartOver()
        }
    }
    
    func showSucceed() {
        hiddenObject(status: true)
        correctImg.isHidden = false
        inputNumberTxt.isHidden = false
        startBtn.isHidden = false
    }
    
    func hiddenObject(status: Bool) {
        correctImg.isHidden = status
        startBtn.isHidden = status
        inputNumberTxt.isHidden = status
        wrongImg.isHidden = status
        
        statusLB.isHidden = status
        n1Btn.isHidden = status
        n2Btn.isHidden = status
        n3Btn.isHidden = status
        n4Btn.isHidden = status
        n5Btn.isHidden = status
        n6Btn.isHidden = status
        n7Btn.isHidden = status
        n8Btn.isHidden = status
        n9Btn.isHidden = status
    }
    
    func btnStartOver() {
        readyToPlayStatus(status: true)
        setNBtnBKColor(BKColor: unPresscolor)
        enableNBtn(status: true)
        currentPos = 0
    }
    
    @IBAction func onStartBtnPressed(_ sender: UIButton) {
        
        if inputNumberTxt.text != nil && inputNumberTxt.text != "" {
            if (try! Int(inputNumberTxt.text!)) != nil {
                maxNumber = Int(inputNumberTxt.text!)!
                if maxNumber >= 1 && maxNumber <= 9 {
                    strStatus = ""
                    statusLB.text = strStatus
                    randomArray = []
                    currentPos = 0
                    
                    readyToPlayStatus(status: true)
                    setNBtnBKColor(BKColor: unPresscolor)
                    enableNBtn(status: true)
                    
                    var countArray = 0
                    var randomNumber = -1
                    var duplicateNumber = true
                    
                    while countArray < maxNumber {
                        duplicateNumber = true
                        while duplicateNumber {
                            randomNumber = (Int)(arc4random_uniform(9))
                            duplicateNumber = checkRepeateNumber(countArray: countArray, randomNumber: randomNumber+1)
                        }
                        randomArray.append(randomNumber+1)
                        countArray += 1
                    }
//                    statusLB.isHidden = false
//                    startBtn.isHidden = false
//                    inputNumberTxt.isHidden = false
//                    statusLB.text = showRandomValue()
                } else{
                    let alert = UIAlertController(title: "Incorrect input", message: "please input number 1-9 only", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
            } else {
                let alert = UIAlertController(title: "Incorrect input", message: "please input number only", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
    
    func showRandomValue() -> String {
        var strResult = ""
        for item in randomArray{
            strResult += (String)(item)
        }
        return strResult
    }
    
    func checkRepeateNumber(countArray:Int, randomNumber:Int) -> Bool {
        var duplicateNumber = false
        var countLoop = 0
        while countLoop < countArray {
            if randomNumber == randomArray[countLoop] {
                duplicateNumber = true
                break
            }
            countLoop += 1
        }
        return duplicateNumber
    }
    
    func enableNBtn(status: Bool)  {
        n1Btn.isEnabled = status
        n2Btn.isEnabled = status
        n3Btn.isEnabled = status
        n4Btn.isEnabled = status
        n5Btn.isEnabled = status
        n6Btn.isEnabled = status
        n7Btn.isEnabled = status
        n8Btn.isEnabled = status
        n9Btn.isEnabled = status
    }
    
    func setNBtnBKColor(BKColor: UIColor)  {
        n1Btn.backgroundColor = BKColor
        n2Btn.backgroundColor = BKColor
        n3Btn.backgroundColor = BKColor
        n4Btn.backgroundColor = BKColor
        n5Btn.backgroundColor = BKColor
        n6Btn.backgroundColor = BKColor
        n7Btn.backgroundColor = BKColor
        n8Btn.backgroundColor = BKColor
        n9Btn.backgroundColor = BKColor
    }
    
    func readyToPlayStatus(status:Bool) {
        correctImg.isHidden = status
        startBtn.isHidden = status
        inputNumberTxt.isHidden = status
        wrongImg.isHidden = status

        statusLB.isHidden = !status
        n1Btn.isHidden = !status
        n2Btn.isHidden = !status
        n3Btn.isHidden = !status
        n4Btn.isHidden = !status
        n5Btn.isHidden = !status
        n6Btn.isHidden = !status
        n7Btn.isHidden = !status
        n8Btn.isHidden = !status
        n9Btn.isHidden = !status
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
