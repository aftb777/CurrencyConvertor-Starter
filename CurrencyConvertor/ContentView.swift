//
//  ContentView.swift
//  CurrencyConvertor
//
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContectViewModel()
    
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Amount")
                .font(.system(size: 18))
                .bold(true)
            
            TextField("", value: $viewModel.amount, formatter: NumberFormatter())
                .font(.system(size: 18))
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1))
                
            HStack{
                // Spacer()
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity)
                //Spacer()
            }
            .padding()
            
            Text("Converted To")
                .font(.system(size: 18))
                .bold(true)
            
            TextField("", value: $viewModel.converted, formatter: NumberFormatter())
                .font(.system(size: 18))
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1))
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
