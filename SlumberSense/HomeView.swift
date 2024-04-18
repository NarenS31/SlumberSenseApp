//
//  HomeView.swift
//  SlumberSense
//
//  Created by Saravanan Saminathan on 4/8/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                Image("sleep")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                    .padding(0)
                    .background(Color.red)
                    .clipShape(Circle())
                Spacer()
                Text("Welcome to SlumberSense")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                Text("Your persoalized sleep app")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .lineLimit(nil)
                
                Spacer()
                
                Button(action: {
                    print("Sign Up Pressed!")
                }, label: {
                    NavigationLink(destination: SignInView().navigationBarBackButtonHidden(true)) {
                        Text("Sign Up")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                    }
                })
                .padding()
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
                Button(action: {
                    print("Login Up Pressed!")
                }, label: {
                    NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                    }
                })
                .padding()
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background {
                    Color.purple.opacity(0.4)
                        .ignoresSafeArea()
                }
            
        }
        
    }
    
}

#Preview {
    HomeView()
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
