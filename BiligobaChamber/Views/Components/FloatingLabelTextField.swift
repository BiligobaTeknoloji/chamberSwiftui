import SwiftUI

struct FloatingLabelTextField: View {
    @Binding var text: String
    var placeholder: String
    @State private var isFocused: Bool = false

    var body: some View {
        VStack(spacing: 0) {  
            ZStack(alignment: .leading) {
                Text(placeholder)
                    .font(.system(size: 16))
                    .foregroundColor(text.isEmpty ? .gray : .blue)
                    .offset(y: isFocused || !text.isEmpty ? -25 : 0)
                    .scaleEffect(isFocused || !text.isEmpty ? 0.75 : 1, anchor: .leading)
                
                TextField("", text: $text, onEditingChanged: { editing in
                    withAnimation {
                        self.isFocused = editing
                    }
                })
            }
            
            Divider()
                .frame(height: 1)
                .background(Color.black.opacity(0.4))
                .padding(.top, 2)
        }
    }
}


struct FloatingLabelTextField_Previews: PreviewProvider {
    @State static var text: String = ""

    static var previews: some View {
        FloatingLabelTextField(text: $text, placeholder: "Your name")
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            .padding()
    }
}



struct FloatingLabelSecureField: View {
    @Binding var text: String
    var placeholder: String
    @FocusState private var isFieldFocused: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .leading) {
                Text(placeholder)
                    .font(.system(size: 16))
                    .foregroundColor(text.isEmpty ? .gray : .blue)
                    .offset(y: isFieldFocused || !text.isEmpty ? -25 : 0)
                    .scaleEffect(isFieldFocused || !text.isEmpty ? 0.75 : 1, anchor: .leading)
//                    .animation(.spring(response: 0.4, dampingFraction: 0.6))
                    .animation(.spring(response: 0.4, dampingFraction: 0.6), value: CGPoint(x: 100, y: 100))
                
                SecureField("", text: $text)
                    .focused($isFieldFocused)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color.black.opacity(0.4))
                .padding(.top, 2)
        }
    }
}
