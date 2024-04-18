//
//  JournalView.swift
//  SlumberSense
//
//  Created by Saravanan Saminathan on 4/8/24.
//

import SwiftUI

struct JournalView: View {
    var body: some View {
        NavigationStack {
            HStack {
                VStack {
                    Spacer()
                    Image("sleep")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.white)
                        .padding(0)
                        .background(Color.red)
                        .clipShape(Circle())
                    Spacer()
                        Text("Welcome To Your Journal.")
                        Text("Enter your thoughts on your sleep.")
                        Text("Click + to make an entry.")
                    Spacer()
                        Button(action: {
                            print("Cancel Pressed!")
                        }, label: {
                            NavigationLink(destination: AddJournalView().navigationBarBackButtonHidden(true)) {
                                Text("Add")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                            }
                        })
                        .padding()
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                }
            }
            Spacer()
        }
        
        
 
    }
}

//struct Journal {
//    var name: String
//    var icon: String
//    var isFavorite: Bool
//
//    static func preview() -> [Journal] {
//        return [Journal(name: "Entry 1", icon: "🍎", isFavorite: true),
//                Journal(name: "Entry 2", icon: "🍌", isFavorite: false),
//                Journal(name: "Entry 3", icon: "🍒", isFavorite: false),
//                Journal(name: "Entry 4", icon: "🥭", isFavorite: true),
//                Journal(name: "Entry 5", icon: "🥝", isFavorite: false),
//        ]
//    }
//}

//struct AddJournalView: View {
//    @State private var presentAlert = false
//    @State private var username: String = ""
//    @State private var password: String = ""
//    
//    var body: some View {
//        Button("Show Alert") {
//            presentAlert = true
//        }
//        .alert("Login", isPresented: $presentAlert, actions: {
//            TextField("Username", text: $username)
//
//            SecureField("Password", text: $password)
//
//            
//            Button("Login", action: {})
//            Button("Cancel", role: .cancel, action: {})
//        }, message: {
//            Text("Please enter your username and password.")
//        })
//    }
//}

#Preview {
    JournalView()
}
