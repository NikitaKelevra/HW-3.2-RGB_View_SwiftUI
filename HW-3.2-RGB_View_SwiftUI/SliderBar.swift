//
//  SliderBar.swift
//  HW-3.2-RGB_View_SwiftUI
//
//  Created by Сперанский Никита on 05.06.2021.
//

import SwiftUI

struct SliderBar: View {
    
    @Binding var value: Double
    
    var sliderColor: UIColor
    var body: some View {
        
        HStack {
            Text("\(lround(value))")
                .frame(maxWidth: 50)
                .padding(.leading, 10)
            Slider(value: $value, in: 0...255)
            EditView(value: $value)
        }
        .accentColor(Color(sliderColor))
        .background(Color.black.opacity(0.2))
        .cornerRadius(30)
    }
}

struct SliderBar_Previews: PreviewProvider {
    static var previews: some View {
        SliderBar(value: .constant(200) , sliderColor: .blue)
    }
}

struct EditView: View {
    
    @State private var alertPressented: Bool = false
    @Binding var value: Double
    
    var body: some View {
        let valueFormatter = Binding<String>(
            get: {String(format: "%.00f", Double(self.value))},
            set: {
                if let someValue = NumberFormatter().number(from: $0) {
                    self.value = someValue.doubleValue
                }
            }
        )
        
        TextField(
            "\(lround(value))", text: valueFormatter)
            
            .alert(isPresented: $alertPressented,
                   content: {
                    Alert(
                        title: Text("Введенное число должно быть в диапазоне от 0 до 255")
                    )
                   }
            )
            .frame(maxWidth: 45)
            .scaledToFit()
            .keyboardType(.numberPad)
            .padding(5)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .disableAutocorrection(true)
            .padding(.trailing, 10)
            .onChange(of: value) {
                changedValue in
                if Double(changedValue) < 0 || Double(changedValue) > 255 {
                    value = 255
                    alertPressented.toggle()
                    print("Ups! Check the Value!!!!!!!")
                    return
                }
            }
    }
}
