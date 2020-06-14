//
//  CurrencyModelPicker.swift
//  con
//
//  Created by Пользователь on 12.06.2020.
//  Copyright © 2020 Eduard Elenskii. All rights reserved.
//

import UIKit

class CurrencyModelPicker: UIPickerView {
    var modelData: [CurrencyModel]!
    var myValues:[Double] = []
    
    var activeCurrency:Double = 0;
}

extension CurrencyModelPicker: UIPickerViewDataSource {

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modelData.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}
extension CurrencyModelPicker: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        
    
        let currencyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        currencyLabel.text = modelData[row].Currency
        currencyLabel.textColor = UIColor.black
        currencyLabel.textAlignment = .center
        let currencyLabelRotationAngle: CGFloat!
        currencyLabelRotationAngle = 90 * (.pi/180)
        currencyLabel.transform = CGAffineTransform(rotationAngle: currencyLabelRotationAngle)
        currencyLabel.font = UIFont.systemFont(ofSize: 52, weight: UIFont.Weight.thin)
        view.addSubview(currencyLabel)
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
        {
            activeCurrency = myValues[row]
        }
        
        return view
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        NotificationCenter.default.post(name: Notification.Name("pickersChanged"), object: self)
    }

}
