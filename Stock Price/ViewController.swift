//
//  ViewController.swift
//  Stock Price
//
//  Created by Rosario Tarabocchia on 9/22/15.
//  Copyright © 2015 RLDT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtOriginalPrice: UITextField!
    @IBOutlet weak var txtAmountBought: UITextField!
    @IBOutlet weak var txtSellingPrice: UITextField!
    @IBOutlet weak var lblPercentIncrease: UILabel!
    @IBOutlet weak var lblProfit: UILabel!
    @IBOutlet weak var lblBoughtFor: UILabel!
    @IBOutlet weak var lblSoldFor: UILabel!
    
    var originalPrice = ""
    var amountBought = ""
    var sellingPrice = ""
   
    
    var percentIncrease : Float = 0
    var profit : Float = 0
    var boughtFor : Float = 0
    var soldFor : Float = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func btnCalculateACTION(sender: UIButton) {
        
        takeInData()
        calculatePrice()
    }
    
    
    @IBAction func btnClearACTION(sender: UIButton) {
        
        clear()
        
    }
    
    func takeInData(){
        
        originalPrice = txtOriginalPrice.text!
        amountBought = txtAmountBought.text!
        sellingPrice = txtSellingPrice.text!
        
    }
    
    
    func calculatePrice(){
        
        var fOriginalPrice = Float(originalPrice)
        var fAmountBought = Float(amountBought)
        var fSellingPrice = Float(sellingPrice)
        
        percentIncrease = ((fSellingPrice! - fOriginalPrice!) / fOriginalPrice!) * 100
        
        profit = (fSellingPrice! * fAmountBought!) - (fOriginalPrice! * fAmountBought!)
        
        boughtFor = (fAmountBought! * fOriginalPrice!)
        
        soldFor = (fAmountBought! * fSellingPrice!)
        
        
        printProfit()
        
        
    }
    
    func clear(){
        
        txtOriginalPrice.text = ""
        txtAmountBought.text = ""
        txtSellingPrice.text = ""
        lblProfit.text = ""
        lblPercentIncrease.text = ""
        lblSoldFor.text = ""
        lblBoughtFor.text = ""
        
        
        
        
    }
    
    func printProfit(){
        
        var sProfit = String(format: "%0.2f", profit)
        var sPercent = String(format: "%0.2f", percentIncrease)
        var sBought = String(format: "%0.2f", boughtFor)
        var sSold = String(format: "%0.2f", soldFor)
        
        lblPercentIncrease.text = "\(sPercent)%"
        lblProfit.text = "$\(sProfit)"
        lblBoughtFor.text = "$\(sBought)"
        lblSoldFor.text = "$\(sSold)"
        
        
    }
    
    func hideTheKeyboard(){
        
        txtAmountBought.resignFirstResponder()
        txtSellingPrice.resignFirstResponder()
        txtOriginalPrice.resignFirstResponder()
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        hideTheKeyboard()
    }
 


}

