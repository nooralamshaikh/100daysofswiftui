//
//  ContentView.swift
//  conv
//
//  Created by Noor on 14/02/24.
//

import SwiftUI
enum Temperature: String, CaseIterable {
    case celsius
    case fahrenheit
    case kelvin
    
    func capitalized() -> String {
        self.rawValue.capitalized
    }
}

struct ContentView: View {
    var temperatureFormats = Temperature.allCases
    @State private var inputFormat: Temperature = .celsius
    @State private var outputFormat: Temperature = .celsius
    @State private var inputString = 0.0
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var converted: Double {
        return convert(from: inputFormat, to: outputFormat, temperature: inputString)
    }
    var body: some View {
        Form(content: {
            Section("From") {
                ConvPicker(list: temperatureFormats,
                           selected: $inputFormat) { selected in
                    Text(selected.capitalized())
                }
            }
            Section("To") {
                ConvPicker(list: temperatureFormats,
                           selected: $outputFormat) { selected in
                    Text(selected.capitalized())
                }
            }
            Section("Enter values in \(inputFormat.capitalized())") {
                TextField("Enter input temperature", value: $inputString, formatter: formatter)
            }
            Section("Converted value in \(outputFormat.capitalized())") {
                Text("\(converted)")
            }
        })
    }
    
    func convert(from: Temperature, to: Temperature, temperature: Double) -> Double {
        switch (from, to) {
        case (.celsius, .fahrenheit):
            return temperature * (9/5) + 32
        case (.fahrenheit, .celsius):
            return (temperature - 32) * 5/9
        default:
            return 0.0
        }
    }
}

#Preview {
    ContentView()
}

struct ConvPicker<T: Hashable, ListContent: View>: View {
    
    var list: [T]
    @Binding var selected: T
    var content: (T) -> ListContent
    
    var body: some View {
        Picker("Select the type",
               selection: $selected) {
            ForEach(list, id: \.self) { format in
                content(format)
            }
        }
        .pickerStyle(.segmented)
    }
}
