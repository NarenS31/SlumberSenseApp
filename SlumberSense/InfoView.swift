//
//  InfoView.swift
//  SlumberSense
//
//  Created by Saravanan Saminathan on 4/8/24.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
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
            Text("Here will be your health info")
            Text("Click this button to take your Analysis")
            
            Button(action: {
                print("Cancel Pressed!")
            }, label: {
                NavigationLink(destination: SimAnalysis(analysis:Analysis(name : "Sara", sleepHoursComents: "trewt", alchoholComents: "ads", smokingComents: "asd", caffeineComents: "ads", bedTime: -1, wakeTime:  -1, ageOption: -1)))  {
                    Text("Simple Analysis")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                }
            })
            .padding()
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
    }
}
#Preview {
    InfoView()
}
