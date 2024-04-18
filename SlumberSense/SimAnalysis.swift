//
//  SimAnalysis1.swift
//  SlumberSense
//
//  Created by Saravanan Saminathan on 4/11/24.
//

import SwiftUI

struct SimAnalysis: View {
    @State private var ageOptionsIndex = 0
    @State private var bedTimeOptionsIndex = 0
    @State private var wakeupTimeOptionsIndex = 0
    @State private var resultFound = false
    @State private var simanaresult: Any?
    @State private var showDeepAnaBtn = false
    @State var analysis : Analysis
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
    
   
    
    var body: some View {
        Text("Hi there.")
        Text("Here, you can take a simple Analysis")
            .multilineTextAlignment(.center)
            .padding(.top, 0.0)
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
                
                if resultFound {
                    Section(header: Text("Result")) {
                        if let rank = simanaresult as? String {
                            Text("\(rank)")
                            .padding()
                            .foregroundColor(Color.blue)
                        }
                    }
                }
            }
        }
        if(showDeepAnaBtn) {
            Button(action: {
                print("Deep Analysis!")
                //print(analysis.ageOption)
            }, label: {
                NavigationLink(destination: DeepAnalysis(analysis:analysis).navigationBarBackButtonHidden(true)) {
                    Text("Deep Analysis")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                }
            })
            .padding()
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        
        
        Button {
            Task {
                print("Next Pressed!")
                let bedTime = Int(self.bedTimeOptions[bedTimeOptionsIndex].key)
                let wakeTime = Int(self.wakeupTimeOptions[wakeupTimeOptionsIndex].key)
                let ageOption = self.ageOptions[ageOptionsIndex].key
                
                var tempAnalysis: Analysis! = Analysis.all()
                
                tempAnalysis.ageOption = ageOptionsIndex
                tempAnalysis.bedTime = bedTimeOptionsIndex
                tempAnalysis.wakeTime = wakeupTimeOptionsIndex;
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
                    var url = URL(string: "http://18.117.101.153:3000/simanalysis")
                    url?.append(queryItems: [URLQueryItem(name: "ageoption", value: ageOption),URLQueryItem(name: "sleephours", value: String(sleepHours))])
                    let (data, _) = try await URLSession.shared.data(from: url!)
                    let decodedResponse = try? JSONDecoder().decode(APIResponse.self, from: data)
                    if decodedResponse != nil {
                        self.resultFound = true;
                        print(decodedResponse?.message);
                        tempAnalysis.sleepHoursComents = decodedResponse?.message;
                        analysis = tempAnalysis;
                        simanaresult = decodedResponse?.message;
                        if(decodedResponse?.message == "Deep Analysis Recomended") {
                            showDeepAnaBtn = true
                        }else {
                            showDeepAnaBtn = false
                        }
                        inProgress = false
                    }else {
                        inProgress = false
                        self.resultFound = false;
                        print("API call failed")
                    }
                }catch{
                    inProgress = false
                    print(error)
               }
            }
        } label: {
               Text("Next")
                   .frame(maxWidth: .infinity)
                   .foregroundColor(.white)
        }.padding()
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .disabled(inProgress)
    }
}

struct DropDown {
    var key: String
    var value: String
    
    init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}

struct SimpAnalysisData {
//    var ageOptionsIndex: Int
//    var bedTimeOptionsIndex: Int
    var wakeupTimeOptionsIndex: Int
    init(wakeupTimeOptionsIndex : Int) {
//    init(ageOptionsIndex: Int, bedTimeOptionsIndex: Int, wakeupTimeOptionsIndex : Int) {
//        self.ageOptionsIndex = ageOptionsIndex
//        self.bedTimeOptionsIndex = bedTimeOptionsIndex
        self.wakeupTimeOptionsIndex = wakeupTimeOptionsIndex
    }
    
}

struct APIResponse: Codable {
    let message: String
}

#Preview {
    SimAnalysis(analysis: Analysis.all())
}
