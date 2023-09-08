import SwiftUI

struct DetailedChatView: View {
    var contact: Contact
    @State private var isExtended: Bool = false
    @State private var messageText = ""
    @Environment(\.dismiss) var dismiss
    @State private var keyboardHeight: CGFloat = 0.0
    
    @State private var messages: [Message] = [
        Message(text: "Hello!", isCurrentUser: false),
        Message(text: "Hi there!", isCurrentUser: true),
        Message(text: "Hello!", isCurrentUser: false),
        Message(text: "Hi there!", isCurrentUser: true),
        Message(text: "Hello!", isCurrentUser: false),
        Message(text: "Hi there!", isCurrentUser: true),
        Message(text: "Hello!", isCurrentUser: false),
        Message(text: "Hi there!", isCurrentUser: true),
        Message(text: "Hello!", isCurrentUser: false),
        Message(text: "Hi there!", isCurrentUser: true),
        Message(text: "Hello!", isCurrentUser: false),
        Message(text: "Hi there!", isCurrentUser: true),
        Message(text: "Hello!", isCurrentUser: false),
        Message(text: "Hi there!", isCurrentUser: true),
        Message(text: "Hello!", isCurrentUser: false),
        Message(text: "Hi there!", isCurrentUser: true),
    ]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // Background
                
                BackgroundColor()
                
                // Chat content
                ScrollView {
                    ScrollViewReader{ ScrollView in
                        LazyVStack {
                            ForEach(messages) { message in
                                ChatBubble(isSender: message.isCurrentUser, message: message.text)
                                    .id(message.id)
                            }
                        }
                        .onChange(of: messages) { newValue in
                            withAnimation {
                                ScrollView.scrollTo(messages.last?.id, anchor: .bottom)
                            }
                        }
                    }
                }
                .padding(.top, 80)
                
                VStack {
                    Spacer()
                    
                    // Text input at the bottom
                    messageInput
                    
                    // Contact info
                    
                }
                .ignoresSafeArea()
                
                
                HomeTopIcon()
                contactInfo
                    .offset(y: geo.size.height * -0.48)
            }
            .adjustForKeyboardHeight($keyboardHeight)
            .onTapGesture(perform: {
                withAnimation {
                    isExtended = false
                }
            })
        }
    }
    
    var contactInfo: some View {
        HStack {
            Circle()
                .frame(width: 70)
                .foregroundColor(.white)
            VStack(alignment: .leading) {
                Text(contact.name)
                    .font(.title2)
                    .foregroundColor(.white)
                if contact.staus == true {
                    Text("Online")
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            Spacer()
            Menu{
                Button(role: .destructive) {} label: {
                    Label("Delete", systemImage: "trash")
                }
                Button {} label: {
                    Label("Button 2", systemImage: "square.and.pencil")
                }
                Button{} label: {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
            } label: {
                Image(systemName: "ellipsis")
                    .font(.title.bold())
                    .rotationEffect(Angle(degrees: 90))
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
    
    var messageInput: some View {
        VStack {
            RectangleButton(isExtended: $isExtended)
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.backward")
                        .padding(.leading)
                        .font(.title)
                        .foregroundColor(.black)
                }
                TextField("Type a message...", text: $messageText)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 30).foregroundColor(.white))
                    .foregroundColor(.black)
                    .overlay(
                        HStack {
                            Spacer()
                            Button(action: sendMessage) {
                                Image(systemName: "paperplane.fill")
                                    .font(.title)
                                    .foregroundColor(.black)
                            }
                            .padding(.trailing)
                        }
                    )
            }
            .padding(.trailing)
            .padding(.trailing)
            .padding(.vertical)
            .background(Color.blue)
        }
        .offset(y: -self.keyboardHeight)
        .animation(.spring(), value: 1)
    }
    
    private func sendMessage() {
        messages.append(Message(text: messageText, isCurrentUser: true))
        messageText = ""
    }
}

extension View {
    func adjustForKeyboardHeight(_ keyboardHeight: Binding<CGFloat>) -> some View {
        self.onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { Notification in
                guard let keyboardFrame = Notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                keyboardHeight.wrappedValue = keyboardFrame.height
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                keyboardHeight.wrappedValue = 0
            }
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(UIResponder.keyboardWillShowNotification)
            NotificationCenter.default.removeObserver(UIResponder.keyboardWillHideNotification)
        }
    }
}

struct DetailedChatView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedChatView(contact: Contact(id: 1, name: "ALI", message: "how are you", staus: true))
    }
}
