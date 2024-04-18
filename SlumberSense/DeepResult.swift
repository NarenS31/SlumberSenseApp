//
//  DeepResult.swift
//  SlumberSense
//
//  Created by Saravanan Saminathan on 4/11/24.
//

import SwiftUI

struct DeepResult: View {
    @State private var age: String = "Teenager - 14 to 17"
    @State private var wakeuptime: String = "8 am"
    @State private var bedtime: String = "11 pm"
    @State private var bedtimerec: String = "Go to bed early"
    
    var analysis : Analysis
    var caffeinValue : String
    var smokeValue : String
    var alchoholValue : String
    
    
    var body: some View {
        VStack{
            Form {
                Section(header: Text("Age Entered")) {
                    Text("\(age)")
                   .foregroundColor(Color.blue)
                }.padding(.top,0)
                
                Section(header: Text("Bedtime & Wakeup Time & Recomendation")) {
                    Text("\(bedtime)" + " \(wakeuptime)")
                   .foregroundColor(Color.blue)
                    Text("\(bedtimerec)")
                        .foregroundColor(Color.orange)
                }.padding(.top,0)
                
                Section(header: Text("Caffein Intake & Recomendation")) {
                    Text(caffeinValue)
                   .foregroundColor(Color.blue)
                    Text(analysis.caffeineComents ?? "N/A")
                        .foregroundColor(Color.orange)
                }.padding(.top,0)
                
                Section(header: Text("Smoking & Recomendation")) {
                    Text(smokeValue)
                   .foregroundColor(Color.blue)
                    Text(analysis.smokingComents ?? "N/A")
                   .foregroundColor(Color.orange)
                }.padding(.top,0)
                
                Section(header: Text("Alchohol Intake & Recomendation")) {
                    Text(alchoholValue)
                   .foregroundColor(Color.blue)
                    Text(analysis.alchoholComents ?? "N/A")
                   .foregroundColor(Color.orange)
                }.padding(.top,0)
            }
            
            
            Button(action: {
                print("Close!")
            }, label: {
                NavigationLink(destination: DashboardView().navigationBarBackButtonHidden(true)) {
                    Text("Close")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                }
            })
            .padding()
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            Spacer()
        }
    }
}

#Preview {
    DeepResult(analysis : Analysis.all(), caffeinValue : "No", smokeValue : "No", alchoholValue : "No")
}
