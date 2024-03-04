//
//  ContentView.swift
//  WeSplit
//
//  Created by Tesco Labs on 04/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeopleIndex = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        return checkAmount + tipValue
    }
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeopleIndex + 2)
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "GBP")).keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeopleIndex) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                .pickerStyle(.navigationLink)
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text("\($0) %")
                        }
                    }
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
                } header: {
                    Text("Amount per person:")
                }
                
                Section{
                    Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
                } header: {
                    Text("Total amount for check:")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


