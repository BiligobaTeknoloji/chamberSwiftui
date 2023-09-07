//
//  HomeView.swift
//  biligoba
//
//  Created by Ali Amer on 8/17/23.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedView: Int = 1
    @AppStorage("pageHomeSelected") var PageHomeSelected: Int = 1
    
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    
                    BackgroundColor()
                    
                    
                    Group {
                        switch PageHomeSelected {
                        case 1:
                            VStack(spacing: 0) {
                                ScrollView {
                                    ForEach(contacts) { contact in
                                        NavigationLink(destination: DetailedChatView(contact: contact).navigationBarBackButtonHidden(true)) {
                                            ChatView(name: contact.name, message: contact.message)
                                        }
                                        Divider()
                                            .padding(.horizontal, 40)
                                    }
                                }
                            }
                            .padding(.top, 90)
                        case 2:
                            Text("Content for second image")
                        case 3:
                            Text("Content for gear image")
                        default:
                            Text("Error")
                        }
                    }
                    
                    
                    if PageHomeSelected == 1 {
                        FloatingActionButton()
                            .offset(x: geo.size.width * 0.37, y: geo.size.height * 0.46)
                    }
                    
                    HomeTopIcon()
                    
                    VStack {
                        HStack(alignment: .top, spacing: 70.0) {
                            Button(action: {
                                selectedView = 1
                                PageHomeSelected = selectedView
                                
                            }) {
                                Image(systemName: "text.bubble.fill")
                                    .font(.title2)
                                    .foregroundColor(PageHomeSelected == 1 ? Color.white : Color.black)
                            }
                            
                            Button(action: {
                                selectedView = 2
                                PageHomeSelected = selectedView
                            }) {
                                Image(systemName: "text.bubble.fill")
                                    .font(.title2)
                                    .foregroundColor(PageHomeSelected == 2 ? Color.white : Color.black)
                            }
                            
                            Button(action: {
                                selectedView = 3
                                PageHomeSelected = selectedView
                            }) {
                                Image(systemName: "gearshape.fill")
                                    .font(.title2)
                                    .foregroundColor(PageHomeSelected == 3 ? Color.white : Color.black)
                            }
                        }
                        Spacer()
                    }
                    .padding(.top)
                }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
