//
//  Rates.swift
//  CurrencyConvertor
//
//  Created by Aftaab Mulla on 14/09/25.
//

import Foundation

struct Rates : Decodable {
    let data : [String : Double]
    
    var rates : [String : Double]{
        return data
    }
}
