import SwiftUI

struct OtpView: View { 
    @State private var showCircle = false
    @State private var showCheckmark = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let text: String
    
    var body: some View {
        ZStack {
            BackgroundColor()
            Image("top")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .allowsHitTesting(false)
                .ignoresSafeArea()
            VStack (spacing: 40){
                Spacer()
                Spacer()
                if showCircle || showCheckmark {
                    VStack {
                        Circle()
                            .foregroundColor(.blue)
                            .frame(width: 60, height: 60)
                            .scaleEffect(showCircle ? 1 : 0)
                            .opacity(showCircle ? 1 : 0)
                            .overlay(Image(systemName: "checkmark")
                                .font(.largeTitle)
                                        .foregroundColor(.white)
                                        .opacity(showCheckmark ? 1 : 0)
                            )
                    }
                }
                Text("description description description description description description")
                OTPTextField(numberOfFields: 6)
                
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            showCircle = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                withAnimation {
                                    showCheckmark = true
                                }
                            }
                        }
                    } label: {
                        Text(text)
                            .font(.title.weight(.bold))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal)
                            .background(
                                Color("bcolor")
                                    .cornerRadius(10)
                                    .shadow(radius: 3)
                            )
                    }
                    Spacer()
                }
                .padding(.top)
                Spacer()
                
                Image(systemName: "arrow.backward")
                            .imageScale(.large)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .onTapGesture {
                                self.presentationMode.wrappedValue.dismiss()
                            }
            }
            .frame(width: 350, height: 600)
            .background(Color.white.opacity(0.3))
        }
    }
}

struct OtpView_Previews: PreviewProvider {
    static var previews: some View {
        OtpView(text: "Create Account")
    }
}
