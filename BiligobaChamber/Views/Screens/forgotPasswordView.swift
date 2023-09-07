//
//  forgotPasswordView.swift
//  biligoba
//
//  Created by Tacettin Pekin on 22.08.2023.
//

import SwiftUI

struct forgotPasswordView: View {
    @State var phone: String = ""
    @State var email: String = ""
    let countryCodeIndices = Array(0..<countryCodes.count)
    @State private var selectedCountryIndex: String = CPData.allCountry[0].id
    @Environment(\.dismiss) var dismiss
    let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundColor()
                
                Image("top")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .allowsHitTesting(false)
                    .ignoresSafeArea()
                
                
                ScrollView{
                    VStack (alignment: .leading, spacing: 0){
                        
                        Spacer()
                        Spacer()
                        
                        HStack {
                            CountryPicker(selectedCountryID: $selectedCountryIndex)
                            FloatingLabelTextField(text: $phone, placeholder: "Phone")
                                .keyboardType(.numberPad)
                            
                            Spacer()
                        }
                        
                        Text("OR*")
                            .padding(.vertical)
                            .font(.caption)
                            .foregroundColor(.black.opacity(0.6))
                        
                        FloatingLabelTextField(text: $email, placeholder: "E-Mail")
                        
                        
                        HStack {
                            Spacer()
                            
                            NavigationLink(destination: OtpView(text: "Confirm").navigationBarBackButtonHidden(true)) {
                                Text("Send")
                                    .font(.title.weight(.bold))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 100)
                                    .background(
                                        Color("bcolor")
                                            .cornerRadius(10)
                                            .shadow(radius: 3)
                                    )
                            }
                            
                            Spacer()
                        }
                        .padding(.top, 30)
                        
                        Spacer()
                        Spacer()
                        Image(systemName: "arrow.backward")
                            .imageScale(.large)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .onTapGesture {
                                dismiss()
                            }
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal, 20)
                    .frame(width: 350, height: 520)
                    .background(Color.white.opacity(0.4))
                }
                .padding(.top, 150)
            }
        }
    }
}

struct forgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        forgotPasswordView()
    }
}
