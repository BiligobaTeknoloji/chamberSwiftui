//
//  OTPTextField.swift
//  biligoba
//
//  Created by Tacettin Pekin on 21.08.2023.
//

import SwiftUI

@available(iOS 15.0, *)
struct OTPTextField: View {
    
    @FocusState private var fieldFocus: Int?
    @State var otpvalue: [String]
    let numberOfFields: Int
    @State private var oldValue = ""
    
    init(numberOfFields: Int) {
        self.otpvalue =  Array(repeating: "", count: numberOfFields)
        self.numberOfFields = numberOfFields
    }
    
    var body: some View {
        HStack{
            ForEach(0..<numberOfFields, id: \.self) { index in
                TextField("", text: $otpvalue[index], onEditingChanged: { editing in
                    if editing {
                        oldValue = otpvalue[index]
                    }
                })
                    .keyboardType(.numberPad)
                    .frame(width: 48, height: 48)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(5)
                    .multilineTextAlignment(.center)
                    .focused($fieldFocus, equals: index)
                    .tag(index)
                    .onChange(of: otpvalue[index]) { newValue in
                        if otpvalue[index].count > 1 {
                            let currentVAlue = Array(otpvalue[index])
                            
                            if currentVAlue[0] == Character(oldValue){
                                otpvalue[index] = String(otpvalue[index].suffix(1))
                            } else {
                                otpvalue[index] = String(otpvalue[index].prefix(1))
                            }
                            
                        }
                        if !newValue.isEmpty {
                            if index == numberOfFields - 1 {
                                fieldFocus = nil
                            } else {
                                fieldFocus = (fieldFocus ?? 0) + 1
                            }
                        } else {
                            fieldFocus = (fieldFocus ?? 0) - 1
                        }
                    }
            }
        }
    }
}

struct OTPTextField_Previews: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        OTPTextField(numberOfFields: 6)
    }
}
