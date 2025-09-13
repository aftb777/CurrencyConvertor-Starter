//
//  ContentView.swift
//  CurrencyConvertor
//
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount : String = ""
    @State private var conversion : String = ""
    @State private var currency : CurrencyChoice = .Usa
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Amount")
                .font(.system(size: 18))
                .bold(true)
            
            TextField("", text: $amount)
                .font(.system(size: 18))
                .padding(.top)
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1))
                
            HStack{
                // Spacer()
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity)
                //Spacer()
            }
            .padding(.top, 25)
            .padding(.bottom, 25)
            
            Text("Converted To")
                .font(.system(size: 18))
                .bold(true)
            
            TextField("", text: $conversion)
                .font(.system(size: 18))
                .padding(.top)
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1))
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
