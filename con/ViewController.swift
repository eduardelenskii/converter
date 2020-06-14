//
//  ViewController.swift
//  con
//
//  Created by Пользователь on 12.06.2020.
//  Copyright © 2020 Eduard Elenskii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myCurrency:[String] = []
    var myValues:[Double] = []
    
    var activeCurrency:Double = 0;
    
    @IBOutlet weak var flippedOne: UIButton!
    @IBOutlet weak var topCurrency: UIPickerView!
    @IBOutlet weak var bottomCurrency: UIPickerView!
    @IBOutlet weak var topAmount: UITextView!
    @IBOutlet weak var bottomAmount: UITextView!
    
    var currencyModelPicker: CurrencyModelPicker!
    var rotationAngle: CGFloat!
    
    @IBAction func bottomToTopAction(_ sender: Any) {
        print("bottom to top top:", topAmount.text,"bottom:", bottomAmount.text)
        if (bottomAmount.text != "") {
            topAmount.text = String(format: "%.3f", (Double(bottomAmount.text!)! * 74))
        
        }
    }
    
    @IBAction func topToBottomAction(_ sender: Any) {
        print("top to bottom top:", topAmount.text,"bottom:", bottomAmount.text)
        if (topAmount.text != "") {
//            && (topCurrency.selectedRow(inComponent: 0) == 0) && (bottomCurrency.selectedRow(inComponent: 2) == 2){
            bottomAmount.text = String(format: "%.3f", (Double(topAmount.text!)! / 74))
        
//        } else if (topAmount.text != "") && (topCurrency.selectedRow(inComponent: 0) == 0) && (bottomCurrency.selectedRow(inComponent: 1) == 1){
//
//            bottomAmount.text = String(Double(topAmount.text!)! * 78.5)
    }
}
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        // PickerViews
        rotationAngle = -90 * (.pi/180)
        var y = topCurrency.frame.origin.y
        topCurrency.transform = CGAffineTransform(rotationAngle: rotationAngle)
        topCurrency.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 100)
        
        y = bottomCurrency.frame.origin.y
        bottomCurrency.transform = CGAffineTransform(rotationAngle: rotationAngle)
        bottomCurrency.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 100)

        currencyModelPicker = CurrencyModelPicker()
        currencyModelPicker.modelData = CurrencyData.getData()
            
        topCurrency.delegate = currencyModelPicker
        topCurrency.dataSource = currencyModelPicker
        
        bottomCurrency.delegate = currencyModelPicker
        bottomCurrency.dataSource = currencyModelPicker
        bottomCurrency.selectRow(2, inComponent: 0, animated: true)
        
        flippedOne.transform = CGAffineTransform(rotationAngle: .pi)
        
    }
        
    // TextViews
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.topAmount.resignFirstResponder()
        self.bottomAmount.resignFirstResponder()
    }
    
    
//    @objc func pickersChanged() {
//        let start = topCurrency.selectedRow(inComponent: 0)
//        let finish = bottomCurrency.selectedRow(inComponent: 0)
//    }
}

    


