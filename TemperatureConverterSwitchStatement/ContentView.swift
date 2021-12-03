//
//  ContentView.swift
//  TemperatureConverterSwitchStatement
//
//  Created by Judy Yu on 2021-12-03.
//

import SwiftUI

struct ContentView: View {
    // MARK: Stored properties
    @State var temperatureInCelsius = 0.0
    
    // MARK: Computed properties
    //process (logic)
    var temperatureInFahrenheit: Double {
        return temperatureInCelsius * 1.8 + 32
    }
    
    //message
    var feedback: String {
        switch temperatureInCelsius {
            case ...(-20):
                return "It's freezing outside! 🥶"
            case -20...0:
                return "Dress warmly!"
            case 0...10:
                return "Need a coat!"
            case 10...20:
                return "Not very cold, not very hot... Perfect!"
            case 20...30:
                return "Warm weather! Wear thin layers."
            default:
                return "Never go out! It's too hot. 🥵"
        }
    }
    
    //the body property is only for input and output
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Celsius")
                    .bold()
                
                Spacer()
            }
            
            // Input: Temperature in Celsius
            Slider(value: $temperatureInCelsius,
                   in: -50.0...50.0,
                   step: 0.1,
                   label: {
                Text("Celsius")
            },
                   minimumValueLabel: {
                Text("-50")
            },
                   maximumValueLabel: {
                Text("50")
            })
            
            // Output: Temperature in Celsius
            Text("\(String(format: "%.1f", temperatureInCelsius)) °C")
                .bold()
                .padding()
            
            HStack {
                Text("Fahrenheit")
                    .bold()
                
                Spacer()
            }
            
            // Output: Temperature in Fahrenheit
            Text("\(String(format: "%.1f", temperatureInFahrenheit)) °F")
                .bold()
                .padding()
            
            //message
            Text(feedback)
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("Temperature Converter")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
