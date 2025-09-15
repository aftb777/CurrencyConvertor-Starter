//
//  ContentView.swift
//  CurrencyConvertor
//
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContectViewModel()
    
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading) {
                HStack {
                    Spacer()
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                    Spacer()
                }
                Text("Amount")
                    .font(.system(size: 18))
                    .bold(true)
                
                TextField("", value: $viewModel.baseAmount, formatter: NumberFormatter())
                    .onSubmit {
                        viewModel.convert()
                    }
                    .font(.system(size: 18))
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1))
                    .overlay(alignment: .trailing) {
                        HStack {
                            viewModel.baseCurrency.image()
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            Menu {
                                ForEach(CurrencyChoice.allCases) { currencyChoice in
                                    Button {
                                        viewModel.baseCurrency = currencyChoice
                                    } label: {
                                        Text(currencyChoice.fetchMenuName())
                                    }
                                    
                                }
                            } label: {
                                Text(viewModel.baseCurrency.rawValue)
                                    .foregroundStyle(.black)
                                    .bold(true)
                                Image(systemName: "chevron.down")
                                    .foregroundStyle(.black)
                                    .bold(true)
                            }
                            
                        }
                        .padding(.horizontal)
                    }
                
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
                
                TextField("", value: $viewModel.convertedAmount, formatter: NumberFormatter())
                    .font(.system(size: 18))
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1))
                
                    .overlay(alignment: .trailing) {
                        HStack {
                            viewModel.convertedCurrency.image()
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            Menu {
                                ForEach(CurrencyChoice.allCases) { currencyChoice in
                                    Button {
                                        viewModel.convertedCurrency = currencyChoice
                                    } label: {
                                        Text(currencyChoice.fetchMenuName())
                                    }
                                    
                                }
                            } label: {
                                Text(viewModel.convertedCurrency.rawValue)
                                    .foregroundStyle(.black)
                                    .bold(true)
                                Image(systemName: "chevron.down")
                                    .foregroundStyle(.black)
                                    .bold(true)
                            }
                            
                        }
                        .padding(.horizontal)
                    }
            }
            .padding(.horizontal)
            .task {
                await viewModel.fetchRates()
            }
            if viewModel.isLoading {
                ZStack{
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                    ProgressView()
                        .tint(.white)
                }
            }
        }
        .onTapGesture {
            viewModel.convert()
        }
    }
}

#Preview {
    ContentView()
}
