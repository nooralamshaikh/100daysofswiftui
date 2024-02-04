//
//  ContentView.swift
//  WeSplit
//
//  Created by Nooralam Shaikh on 01/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var isAmountFocused

    private var totalPerPerson: Double {
        let numberOfPeople = Double(numberOfPeople + 2)
        let perPersonAmount = grandTotal / numberOfPeople
        return perPersonAmount
    }

    private var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                        .keyboardType(.decimalPad)
                        .focused($isAmountFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0...100, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.navigationLink)
                }
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                }
                Section("Grand total amount") {
                    Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if isAmountFocused {
                    Button("Done") {
                        isAmountFocused = false
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
