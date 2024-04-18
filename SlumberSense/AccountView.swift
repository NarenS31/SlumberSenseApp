//
//  AccountUIView.swift
//  SlumberSense
//
//  Created by Saravanan Saminathan on 4/17/24.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationStack {
            HStack{
                Text("Welcome, User!")
                    . font(. system(size: 25))
                    .bold()
            }
            VStack{
                    Text("Welcome to SlumberSense, Your Sleep App for how to imporove sleep.")
                    Text("About 1 in 3 adults in the United States reported not getting enough rest or sleep every day")
                    Text("Estimated 50 to 70 million Americans have chronic, or ongoing, sleep disorders")
                    Spacer()
                }
                .padding()
        }
        
    }
}

#Preview {
    AccountView()
}
