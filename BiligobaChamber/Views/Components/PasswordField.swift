import SwiftUI

struct PasswordField: View {
    @Binding var password: String
    @State private var passwordIsVisible: Bool = false
    var placeholder: String
    
    @FocusState private var isFieldFocused: Bool

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .leading) {
                Text(placeholder)
                    .font(.system(size: 16))
                    .foregroundColor(password.isEmpty ? .gray : .blue)
                    .offset(y: isFieldFocused || !password.isEmpty ? -25 : 0)
                    .scaleEffect(isFieldFocused || !password.isEmpty ? 0.75 : 1, anchor: .leading)
                    .animation(.spring(response: 0.4, dampingFraction: 0.6), value: ValueTransformer())
                
                HStack {
                    if passwordIsVisible {
                        TextField("", text: $password)
                            .focused($isFieldFocused)
                            .frame(maxWidth: .infinity)
                    } else {
                        SecureField("", text: $password)
                            .focused($isFieldFocused)
                            .frame(maxWidth: .infinity)
                    }
                    
                    Image(systemName: passwordIsVisible ? "eye.slash" : "eye")
                        .onTapGesture {
                            passwordIsVisible.toggle()
                        }
                }
            }
            .padding(.top, 15) // Adjusting the top padding so that the placeholder moves correctly
            
            Divider()   // This is the underline for the TextField
                .frame(height: 1)
                .background(Color.black.opacity(0.4))
                .padding(.top, 2)  // Adjusts position of the Divider to appear closer to the TextField
        }
    }
}

struct PasswordField_Previews: PreviewProvider {
    @State static var text: String = ""

    static var previews: some View {
        PasswordField(password: $text, placeholder: "Password")
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            .padding()
    }
}
