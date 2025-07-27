//
//  ContentView.swift
//  unitConverter-iOS
//
//  Created by Sougato Roy on 27/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var unitSelected = "Temperature"
    @State private var inputUnit = "Fahrenheit"
    @State private var outputUnit = "Celsius"
    
    let unitType = ["Temperature", "Length", "Volume", "Time"]
    
    
    //Computed Property for output value calculation
    var outputValue : Double {
        
        let value = inputValue
        
        var valueOutput = value
        
        var celsiusValue : Double
        switch inputUnit{
            case "Fahrenheit":
                celsiusValue = (value - 32.0) * 5 / 9
            case "Kelvin":
                celsiusValue = value - 273.15
            default:
                celsiusValue = value
        }
        
        switch outputUnit{
            case "Fahrenheit":
                valueOutput = (celsiusValue * 1.8) + 32
            case "Kelvin":
                valueOutput = celsiusValue + 273.15
            default:
                valueOutput = celsiusValue
        }
        
        return valueOutput
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("Unit Type", selection: $unitSelected){
                        ForEach(unitType, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                switch unitSelected {
                    case "Temperature":
                        //Section 1
                        Section("For Temperature Conversion"){
                            Picker("Input Unit", selection: $inputUnit) {
                                ForEach(["Celsius", "Fahrenheit", "Kelvin"], id: \.self) {
                                    Text($0)
                                }
                            }
                            Picker("Output Unit", selection: $outputUnit){
                                ForEach(["Celsius", "Fahrenheit", "Kelvin"], id: \.self){
                                    Text($0)
                                }
                            }
                            TextField("Input Value", value: $inputValue, format: .number)
                                .keyboardType(.decimalPad)
                            
                        }
                        
                        //Section2 for output value
                        Section("Converted Value"){
                            Text(outputValue.formatted())
                        }

                    case "Length":
                        Section("For Length Conversion"){
                            Text("Coming Soon!")
                        }
                    case "Volume":
                        Section("For Volume Conversion"){
                            Text("Coming Soon!")
                        }
                    case "Time":
                        Section("For Time COnversion"){
                            Text("Coming Soon!")
                        }
                    default:
                        Text("Coming Soon!")
                }
                            }
            .navigationTitle("Unit Converter iOS")
        }
    }
}

#Preview {
    ContentView()
}
