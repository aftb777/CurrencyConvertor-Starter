//
//  ContectViewModel.swift
//  CurrencyConvertor
//
//  Created by Aftaab Mulla on 13/09/25.
//

import Foundation

@MainActor
class ContectViewModel : ObservableObject {
    
    @Published var convertedAmount : Double = 1.0
    @Published var baseAmount : Double = 1.0
    @Published var baseCurrency : CurrencyChoice = .Usa
    @Published var convertedCurrency : CurrencyChoice = .Usa
    @Published var rates : Rates?
    @Published var isLoading : Bool = false
    @Published var errorMessage : String = ""
    
    // Computed property for currency
    // Here type is NumberFormatter and now it is also an Object
    // it converts string into Double/Int/Float
    
    var numberFormatter : NumberFormatter{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = ""
        numberFormatter.maximumFractionDigits = 4
        numberFormatter.minimumFractionDigits = 2
        return numberFormatter
    }
    
    func fetchRates() async {
        let baseUrl = "YOUR API KEY"
        guard let url = URL(string: baseUrl) else {
            errorMessage = "Could not fetch rates"
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        isLoading = true
        do {
            let(data, _) = try await URLSession.shared.data(for: urlRequest)
            rates = try JSONDecoder().decode(Rates.self, from: data)
        } catch {
            errorMessage = "Could not fetch rates"
            print(error.localizedDescription)
        }
        isLoading = false
    }
    
    func convert() {
        if let rates = rates,
           let baseExchangeRate = rates.rates[baseCurrency.rawValue],
           let convertedExchangeRate = rates.rates[convertedCurrency.rawValue] {
            convertedAmount = (convertedExchangeRate / baseExchangeRate) * baseAmount
        }
    }
}
