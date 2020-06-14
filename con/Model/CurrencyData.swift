//
//  File.swift
//  con
//
//  Created by Пользователь on 12.06.2020.
//  Copyright © 2020 Eduard Elenskii. All rights reserved.
//

import Foundation

class CurrencyData {
    class func getData() -> [CurrencyModel] {
        var data = [CurrencyModel]()
        data.append(CurrencyModel(Currency: "RUB"))
        data.append(CurrencyModel(Currency: "EUR"))
        data.append(CurrencyModel(Currency: "USD"))
        data.append(CurrencyModel(Currency: "GBP"))
        data.append(CurrencyModel(Currency: "UAH"))
        data.append(CurrencyModel(Currency: "CHF"))
        data.append(CurrencyModel(Currency: "CAD"))
        data.append(CurrencyModel(Currency: "AUD"))
        
        return data
    }

}
