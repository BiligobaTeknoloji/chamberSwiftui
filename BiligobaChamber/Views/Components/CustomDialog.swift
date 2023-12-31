//
//  CustomDialog.swift
//  biligoba
//
//  Created by Tacettin Pekin on 23.08.2023.
//

import SwiftUI

struct CustomDialog: View {
    var closeAction: () -> Void
    
    var body: some View {
        VStack (alignment: .leading){
            Image(systemName: "xmark")
                .font(.title2.bold())
                .frame(maxWidth: .infinity , alignment: .trailing)
                .padding()
                .onTapGesture {
                    closeAction()
                }
            Text("Terms & Conditions")
                .font(.title2.bold())
            
            ScrollView {
                Text("1. The Intellectual Property disclosure will inform users that the contents, logo and other visual media you created is your property and is protected by copyright laws.\n")
                    .font(.subheadline)
                
                Text("2. A Termination clause will inform that users' accounts on your website and mobile app or users' access to your website and mobile (if users can't have an account with you) can be terminated in case of abuses or at your sole discretion.\n")
                    .font(.subheadline)
                Text("3. A Governing Law will inform users which laws govern the agreement. This should be the country in which your company is headquartered or the country from which you operate your website and mobile app.\n")
                    .font(.subheadline)
                Text("4. A Links To Other Web Sites clause will inform users that you are not responsible for any third party websites that you link to. This kind of clause will generally inform users that they are responsible for reading and agreeing (or disagreeing) with the Terms and Conditions or Privacy Policies of these third parties.\n")
                    .font(.subheadline)
                Text("If your website or mobile app allows users to create content and make that content public to other users, a Content section will inform users that they own the rights to the content they have created. The 'Content' clause usually mentions that users must give you (the website or mobile app developer) a license so that you can share this content on your website/mobile app and make it available to other users.\n")
                    .font(.subheadline)
                Text("Because the content created by users is public to other users, a DMCA notice clause (or Copyright Infringement) section is helpful to inform users and copyright authors that, if any content is found to be a copyright infringement, you will respond to any DMCA takedown notices received and you will take down the content.\n")
                    .font(.subheadline)
                Text("A Limit What Users Can Do clause can inform users that by agreeing to use your service, they're also agreeing to not do certain things. This can involve a lengthy and thorough list in your Terms and Conditions agreements so as to encompass the most amount of negative uses.\n")
                    .font(.subheadline)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 5) // Blue stroke border
                .background(Color.white) // Set the background color
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 22)
        .padding(40)
    }
}

struct CustomDialog_Previews: PreviewProvider {
    static var previews: some View {
        CustomDialog(closeAction: {
            print("test")
        })
    }
}
