//
//  NewPassword.swift
//  biligoba
//
//  Created by Tacettin Pekin on 25.08.2023.
//

import SwiftUI

struct NewPassword: View {
    @State var password: String = ""
    @State var confrimPassword = ""
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
                
                
                
                VStack (alignment: .leading, spacing: nil){
                  
                    Spacer()
                  
                    PasswordField(password: $password, placeholder: "Passwrod")
                        .padding(.horizontal)
                    PasswordField(password: $password, placeholder: "Confrim Password")
                        .padding(.horizontal)
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                            Text("OK")
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
                        .padding(.top, 40)
                        
                        Spacer()
                    }
                    
                    Spacer()
                    Spacer()
                    
                    Image(systemName: "arrow.backward")
                        .imageScale(.large)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .onTapGesture {
                            
                        }
                    
                }
                .padding(.horizontal, 20)
                .frame(width: 350, height: 520)
                .background(Color.white.opacity(0.4))
            }
        }
    }
}

struct NewPassword_Previews: PreviewProvider {
    static var previews: some View {
        NewPassword()
    }
}
