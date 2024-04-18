//
//  DeepAnalysis1.swift
//  SlumberSense
//
//  Created by Saravanan Saminathan on 4/12/24.
//

import SwiftUI

struct DeepAnalysis: View {
    @State private var ageOptionsIndex = 0
    @State private var bedTimeOptionsIndex = 0
    @State private var wakeupTimeOptionsIndex = 0
    @State private var alchoholIntakeTimeOptionsIndex = 0
    @State private var caffeineOptionsIndex = 0
    @State private var smokingOptionsIndex = 0
    @State private var disordersOptionsIndex = 0
    @State private var generOptionsIndex = 0;
    @State private var isDeepAnaDone: Bool = false
    @State var analysis : Analysis
    @State private var showDeepAnaResultBtn = false
    @State var inProgress = false
    
    var ageOptions = [
        DropDown(key : "Newborn", value :"Newborn - 0 to 3 months"),
        DropDown(key : "Infant", value :"Infant - 4 to 11 months"),
        DropDown(key : "Toddler", value :"Toddler - 1 to 2"),
        DropDown(key : "Preschool", value :"Preschool - 3 to 5"),
        DropDown(key : "School Age", value :"School Age - 6 to 13"),
        DropDown(key : "Teenager", value :"Teenager - 14 to 17"),
        DropDown(key : "Young Adult", value :"Young Adult - 8 to 25"),
        DropDown(key : "Adult", value :"Adult - 26 to 64"),
        DropDown(key : "Older Adult", value :"Older Adult - 65+"),
    ]
    var bedTimeOptions = [
        DropDown(key : "7", value :"7 pm"),
        DropDown(key : "8", value :"8 pm"),
        DropDown(key : "9", value :"9 pm"),
        DropDown(key : "10", value :"10 pm"),
        DropDown(key : "11", value :"11+ pm"),
    ]
    
    var wakeupTimeOptions = [
        DropDown(key : "7", value :"7 am"),
        DropDown(key : "8", value :"8 am"),
        DropDown(key : "9", value :"9 am"),
        DropDown(key : "10", value :"10 am"),
        DropDown(key : "11", value :"11+ am"),
    ]
    
    
    var alchoholIntakeTimeOptions = [
        DropDown(key : "0", value :"No"),
        DropDown(key : "1", value :"1 serving"),
        DropDown(key : "2", value :"2 servings"),
        DropDown(key : "3", value :"3 servings"),
    ]
    
    var yesNoOptions = [
        DropDown(key : "0", value :"No"),
        DropDown(key : "1", value :"Yes"),
    ]
    
    var generOptions = [
        DropDown(key : "0", value :"Male"),
        DropDown(key : "1", value :"FeMale"),
    ]
    
   
    var body: some View {
        
        
//        Text("Hi there.")
//        Text("Here, you can take a deep Analysis")
//            .multilineTextAlignment(.center)
//            .padding(.top, 0.0)
        
//        VStack{
//            Text($analysis.ageOption)
//        }
        
//        Text(analysis.sleepHoursComents ?? "")
//        Text("\(choice)")
        
        NavigationView {
            Form {
                Section(header: Text("Select Age")) {
                    Picker("Age", selection : $ageOptionsIndex) {
                        ForEach(ageOptions.indices, id:\.self) {i in
                            Text(self.ageOptions[i].value)
                        }
                    }
                }
                Section(header: Text("Select Bedtime")) {
                    Picker("Bedtime", selection : $bedTimeOptionsIndex) {
                        ForEach(bedTimeOptions.indices, id:\.self) {i in
                            Text(self.bedTimeOptions[i].value)
                        }
                    }
                }
                
                Section(header: Text("Select Wake Up Time")) {
                    Picker("Wake Up Time", selection : $wakeupTimeOptionsIndex) {
                        ForEach(wakeupTimeOptions.indices, id:\.self) {i in
                            Text(self.wakeupTimeOptions[i].value)
                        }
                    }
                }
                
                Section(header: Text("Select Gender")) {
                    Picker("Gender", selection : $generOptionsIndex) {
                        ForEach(generOptions.indices, id:\.self) {i in
                            Text(self.generOptions[i].value)
                        }
                    }
                }
                Section(header: Text("Select Alchohol Intake Time")) {
                    Picker("Alchohol Intake", selection : $alchoholIntakeTimeOptionsIndex) {
                        ForEach(alchoholIntakeTimeOptions.indices, id:\.self) {i in
                            Text(self.alchoholIntakeTimeOptions[i].value)
                        }
                    }
                }
                Section(header: Text("Select Caffeine Intake")) {
                    Picker("Caffeine Intake", selection : $caffeineOptionsIndex) {
                        ForEach(yesNoOptions.indices, id:\.self) {i in
                            Text(self.yesNoOptions[i].value)
                        }
                    }
                }
                Section(header: Text("Select Smoking")) {
                    Picker("Smoking", selection : $smokingOptionsIndex) {
                        ForEach(yesNoOptions.indices, id:\.self) {i in
                            Text(self.yesNoOptions[i].value)
                        }
                    }
                }
            }
        }
        
        if(showDeepAnaResultBtn) {
            Button(action: {
                print("Show Results!")
                //print(analysis.ageOption)
            }, label: {
                NavigationLink(destination: DeepResult(analysis: analysis, caffeinValue : self.yesNoOptions[caffeineOptionsIndex].value, smokeValue : self.yesNoOptions[smokingOptionsIndex].value, alchoholValue : self.alchoholIntakeTimeOptions[alchoholIntakeTimeOptionsIndex].value).navigationBarBackButtonHidden(true), isActive: self.$isDeepAnaDone) {
                    Text("Show Result")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                }
            })
            .padding()
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }else {
            Button {
                            Task {
                                print("Next Pressed!")
                                let bedTime = Int(self.bedTimeOptions[bedTimeOptionsIndex].key)
                                let wakeTime = Int(self.wakeupTimeOptions[wakeupTimeOptionsIndex].key)
                                let ageOption = self.ageOptions[ageOptionsIndex].key
                                
                                let alchoholIntakeOption = self.alchoholIntakeTimeOptions[alchoholIntakeTimeOptionsIndex].key
                                let caffeineOption = self.yesNoOptions[caffeineOptionsIndex].key
                                let smokingOption = self.yesNoOptions[smokingOptionsIndex].key
                                let disordersOption = self.yesNoOptions[disordersOptionsIndex].key
                                let generOption = self.generOptions[generOptionsIndex].key
                                
                                print("alchoholIntakeOption :", alchoholIntakeOption)
                                print("caffeineOption: ", caffeineOption)
                                print("smokingOption:", smokingOption)
                                print("disordersOption :", disordersOption)
                                print("generOption:", generOption)
                                
                                
                                var sleepHours : Int = 0;
                                if(bedTime == wakeTime) {
                                    sleepHours = 12;
                                }else if(bedTime == 7){
                                    if(wakeTime == 8) {
                                        sleepHours = 13;
                                    }else if(wakeTime == 9) {
                                        sleepHours = 14;
                                    }else if(wakeTime == 10) {
                                        sleepHours = 15;
                                    }else if(wakeTime == 11) {
                                        sleepHours = 16;
                                    }
                                }else if(bedTime == 8){
                                    if(wakeTime == 7) {
                                        sleepHours = 11;
                                    }else if(wakeTime == 8) {
                                        sleepHours = 12;
                                    }else if(wakeTime == 9) {
                                        sleepHours = 13;
                                    }else if(wakeTime == 10) {
                                        sleepHours = 14;
                                    }else if(wakeTime == 11) {
                                        sleepHours = 15;
                                    }
                                }else if(bedTime == 9){
                                    if(wakeTime == 7) {
                                        sleepHours = 10;
                                    }else if(wakeTime == 8) {
                                        sleepHours = 11;
                                    }else if(wakeTime == 9) {
                                        sleepHours = 12;
                                    }else if(wakeTime == 10) {
                                        sleepHours = 13;
                                    }else if(wakeTime == 11) {
                                        sleepHours = 14;
                                    }
                                }else if(bedTime == 10){
                                    if(wakeTime == 7) {
                                        sleepHours = 9;
                                    }else if(wakeTime == 8) {
                                        sleepHours = 10;
                                    }else if(wakeTime == 9) {
                                        sleepHours = 11;
                                    }else if(wakeTime == 10) {
                                        sleepHours = 12;
                                    }else if(wakeTime == 11) {
                                        sleepHours = 13;
                                    }
                                }else if(bedTime == 11){
                                    if(wakeTime == 7) {
                                        sleepHours = 8;
                                    }else if(wakeTime == 8) {
                                        sleepHours = 9;
                                    }else if(wakeTime == 9) {
                                        sleepHours = 10;
                                    }else if(wakeTime == 10) {
                                        sleepHours = 11;
                                    }else if(wakeTime == 11) {
                                        sleepHours = 12;
                                    }
                                }
                                print(ageOption, sleepHours)
                                
                                inProgress = true
        
                                do {
                                    var url = URL(string: "http://18.117.101.153:3000/deepanalysis")
                                    url?.append(queryItems: [URLQueryItem(name: "ageoption", value: ageOption),URLQueryItem(name: "sleephours", value: String(sleepHours))
                                        ,URLQueryItem(name: "alchoholIntakeOption", value: alchoholIntakeOption)
                                        ,URLQueryItem(name: "caffeineOption", value: caffeineOption)
                                        ,URLQueryItem(name: "smokingOption", value: smokingOption)
                                        ,URLQueryItem(name: "generOption", value: generOption)])
                                    let (data, _) = try await URLSession.shared.data(from: url!)
                                    
                                    let decodedResponse = try? JSONDecoder().decode(DeepAnaResponse.self, from: data)
                                    self.showDeepAnaResultBtn = true;
                                    self.isDeepAnaDone = true;
                                    inProgress = true
                                    if decodedResponse != nil {
                                        analysis.alchoholComents = decodedResponse?.alchoholComents;
                                        analysis.smokingComents = decodedResponse?.smokingComents;
                                        analysis.caffeineComents = decodedResponse?.caffeineComents;
                                    }else {
                                        print("API call failed")
                                    }
                                }catch{
                                    inProgress = false
                                    print(error)
                               }
                            }
                        } label: {
                               Text("Submit")
                                   .frame(maxWidth: .infinity)
                                   .foregroundColor(.white)
                        }.padding(.leading, 20)
                        .padding(.trailing, 20)
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                        .disabled(inProgress)
            }
        }
}

struct DeepAnaResponse: Codable {
    let sleepHoursComents: String
    let alchoholComents: String
    let smokingComents: String
    let caffeineComents: String
}

#Preview {
    DeepAnalysis(analysis : Analysis.all())
}
