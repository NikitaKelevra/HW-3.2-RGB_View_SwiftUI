//
//  ContentView.swift
//  HW-3.2-RGB_View_SwiftUI
//
//  Created by Сперанский Никита on 05.06.2021.
//

import SwiftUI


struct ContentView: View {
    
    @State private var redLightValueSlider = Double.random(in: 0...255)
    @State private var greenLightValueSlider = Double.random(in: 0...255)
    @State private var blueLightValueSlider = Double.random(in: 0...255)
    
    var body: some View {
        VStack {
            MainView(redLightValueSlider: $redLightValueSlider, greenLightValueSlider: $greenLightValueSlider, blueLightValueSlider: $blueLightValueSlider)
            
            SliderBar(value: $redLightValueSlider, sliderColor: .red)
            SliderBar(value: $greenLightValueSlider, sliderColor: .green)
            SliderBar(value: $blueLightValueSlider, sliderColor: .blue)
        }
        .padding(.vertical)
        .background(Color(.purple).opacity(0.5))
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(.black),
                            lineWidth: 2))
        Spacer()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView: View {
    
    @Binding var redLightValueSlider: Double
    @Binding var greenLightValueSlider: Double
    @Binding var blueLightValueSlider: Double
        
    var body: some View {
        Text(" ")
            .padding(.top, 200)
            .padding(.horizontal, 200)
            .background(Color(red: redLightValueSlider,
                              green: greenLightValueSlider,
                              blue: blueLightValueSlider,
                              opacity: 1))
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(.black),
                                lineWidth: 2)
            )
    }
}
