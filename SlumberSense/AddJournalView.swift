//
//  AddJournalView.swift
//  SlumberSense
//
//  Created by Saravanan Saminathan on 4/17/24.
//

import SwiftUI

struct AddJournalView: View {
    @State var title: String = ""
    @State var description: String = ""
    @State var inProgress = false
    @State var email = "sar762009@gmail.com"
    
    var body: some View {
        HStack{
            Text("Add Journal")
                . font(. system(size: 25))
                .bold()
        }
        Form {
            TextField("Title", text: $title)
            TextField("Description", text: $description)
        }
        
        Button {
            Task {
                print("Add Journal btn clicked..", title, description)
                inProgress = true;
                do {
                    let url = URL(string: "http://18.117.101.153:3000/journal")
                    if let url {
                        var request = URLRequest(url: url)
                        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                        request.httpMethod = "POST"
                        let encoder = JSONEncoder()
                        var userObj = Journal(id : 0, userid: self.email, journaldesc: self.description, journaltitle:self.title)
                        let data = try encoder.encode(userObj)
                        request.httpBody = data
                        let (responseData, response) = try await URLSession.shared.upload(for: request, from: data)
                        guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
                        print("statusCode: \(response.statusCode)")
                        inProgress = false;
                        if(response.statusCode == 201 ){
                            print("User Registered");
                        }else {
                            print("User Registered failed");
                        }
                    } else {
                        inProgress = false;
                        print("Invalid URL")
                    }
                }catch{
                    inProgress = false;
                    print(error)
               }
            }
        } label: {
//            NavigationLink(destination: DashboardView().navigationBarBackButtonHidden(true), isActive: self.$inProgress) {
               Text("Add Journal")
                   .frame(maxWidth: .infinity)
                   .foregroundColor(.white)
//            }
        }.padding()
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        
        Button(action: {
            print("Cancel Pressed!")
        }, label: {
            NavigationLink(destination: DashboardView().navigationBarBackButtonHidden(true)) {
                Text("Cancel")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
            }
        })
        .padding()
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}

#Preview {
    AddJournalView()
}

struct Journal: Codable {
    let id : Int?
    let userid: String
    let journaldesc: String
    let journaltitle : String
}

