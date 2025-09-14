//
//  ContectViewModel.swift
//  CurrencyConvertor
//
//  Created by Aftaab Mulla on 13/09/25.
//

import Foundation

class ContectViewModel : ObservableObject {
    
    @Published var converted = 1.0
    @Published var amount = 1.0
    @Published var baseCurrency : CurrencyChoice = .Usa
    @Published var convertedCurrency : CurrencyChoice = .Euro
    @Published var rates : Rates?
    
    // Computed property for currency
    // Here type is NumberFormatter and now it is also an Object
    // it converts string into Double/Int/Float
    
    var numberFormatter : NumberFormatter{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = ""
        return numberFormatter
    }
    
    func fetchRates() async {
        let baseUrl = "YOUR API KEYS"
        let url = URL(string: baseUrl)!
        let urlRequest = URLRequest(url: url)
        do {
            let(data, _) = try await URLSession.shared.data(for: urlRequest)
            rates = try JSONDecoder().decode(Rates.self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
