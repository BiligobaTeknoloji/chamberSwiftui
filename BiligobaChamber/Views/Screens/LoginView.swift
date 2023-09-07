//
//  LoginView.swift
//  biligoba
//
//  Created by Ali Amer on 8/15/23.
//

import SwiftUI

struct LoginView: View {
    @State var phone: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var isChecked: Bool = false
    @State private var passwordIsVisible: Bool = false
    @State private var isMenuShown = false
    
    
    @State private var selectedCountryIndex: String = CPData.allCountry[0].id
    
    var selectedCountry: CPData? {
        CPData.allCountry.first { $0.id == selectedCountryIndex }
    }
    
    var body: some View {
        GeometryReader { geo in
            let screenWidth = geo.size.width
            let screenHeight = geo.size.height
            NavigationView {
                ZStack {
                    // MARK: background Color
                    BackgroundColor()
                    
                    ScrollView {
                        VStack (spacing: screenHeight * 0.02){
                            HStack {
                                CountryPicker(selectedCountryID: $selectedCountryIndex)
                                FloatingLabelTextField(text: $phone, placeholder: "Phone")
                                    .keyboardType(.numberPad)
                            }
                            
                            Text("OR*")
                                .font(.footnote)
                                .foregroundColor(.black.opacity(0.5))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            FloatingLabelTextField(text: $email, placeholder: "E-Mail")
                                .disableAutocorrection(true)
                            
                            PasswordField(password: $password, placeholder: "Password")
                                .padding(.top, screenHeight * 0.04)
                            
                            HStack {
                                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isChecked.toggle()
                                    }
                                
                                Text("Keep me logged in")
                                    .font(.caption2)
                                Spacer()
                                
                                NavigationLink (destination: forgotPasswordView().navigationBarBackButtonHidden(true)) {
                                    Text("Forgor Password")
                                        .font(.caption)
                                        .foregroundColor(Color.black)
                                        .underline()
                                }
                            }
                            
                            NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true)) {
                                Text("Log In")
                                    .padding(.horizontal, screenWidth * 0.2)
                                    .padding(.vertical, screenHeight * 0.01)
                                    .font(.title.weight(.bold))
                                    .foregroundColor(.white)
                                    .background(
                                        Color("bcolor")
                                            .cornerRadius(10)
                                            .shadow(radius: 3)
                                    )
                            }
                            .padding(.top, screenHeight * 0.06)
                            
                            HStack {
                                Spacer()
                                Text("Don't you have an account?")
                                    .font(.caption)
                                
                                
                                NavigationLink(destination: SignupView().navigationBarBackButtonHidden(true)) {
                                    Text("Create Account")
                                        .font(.caption)
                                        .foregroundColor(.blue)
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                
                                Spacer()
                            }
                            .padding(screenHeight * 0.01)
                            
                            Text("Log in with")
                                .font(.caption)
                                .foregroundColor(.white)
                            
                            HStack(spacing: screenWidth * 0.06){
                                Spacer()
                                VStack {
                                    Image("facebook")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 30)
                                    Text("Facebook")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                    
                                }
                                Spacer()
                                
                                VStack {
                                    Image("google")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 30)
                                    Text("Google")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                VStack {
                                    Image("twitter")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 30)
                                    Text("Twitter")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                                Spacer()
                            }
                            
                            HStack(spacing: 10) {
                                // Inner HStack for language buttons
                                HStack(spacing: 10) {
                                    ForEach(["En", "Fr", "Ar", "Ge"], id: \.self) { language in
                                        Button(action: {
                                            // TODO: Add action for when the button is tapped
                                            print("\(language) button tapped")
                                        }) {
                                            Text(language)
                                                .foregroundColor(Color.white)
                                                .padding([.leading, .trailing], 10)
                                                .padding([.top, .bottom], 5)
                                                .background(Color.blue)
                                                .cornerRadius(8)
                                                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                                        }
                                        .frame(width: isMenuShown ? nil : 0, alignment: .center)
                                        .opacity(isMenuShown ? 1.0 : 0.0)
                                    }
                                }
                                .if(isMenuShown) { view in
                                    view.overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.blue, lineWidth: 1)
                                    )
                                }
                                .frame(height: 40)
                                
                                // Globe Image
                                Image(systemName: "globe.badge.chevron.backward")
                                    .font(.title)
                                    .onTapGesture {
                                        withAnimation(.easeInOut) {
                                            isMenuShown.toggle()
                                        }
                                    }
                            }
                            .frame(maxWidth: .infinity ,alignment: .trailing)
                            
                        }
                        .padding(.top, screenHeight * 0.26)
                        .padding(.horizontal, screenWidth * 0.1)
                    }
                    .ignoresSafeArea(.keyboard)
                    .navigationBarHidden(true)
                    
                    Image("topicon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .allowsHitTesting(false)
                        .frame(width: geo.size.width, height: geo.size.height ,alignment: .top)
                        .ignoresSafeArea()
                }
            }
            
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(.keyboard)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}



