//
//  SignInView.swift
//  SlumberSense
//
//  Created by Saravanan Saminathan on 4/8/24.
//



import SwiftUI

struct SignInView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var conpassword = ""
    @State private var userRegFailed = false
    @State var inProgress = false
    
    var disableForm: Bool {
        name.count < 5 || email.count < 5
    }
    var body: some View {
        VStack(/*alignment: .leading, spacing: 15*/) {
                    Spacer()
                    Text("Sign In")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color.purple)
                        .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
            Image("sleep")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.white)
                .padding(0)
                .background(Color.red)
                .clipShape(Circle())
            Spacer()

            TextField("Name",
                      text: $name ,
                      prompt: Text("Full Name").foregroundColor(.blue)
            )
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 2)
            }
            .padding(.horizontal)
                    TextField("Email",
                              text: $email ,
                              prompt: Text("Email Address").foregroundColor(.blue)
                    )
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 2)
                    }
                    .padding(.horizontal)
            
                    SecureField("Password",
                              text: $password ,
                              prompt: Text("Password").foregroundColor(.blue)
                    )
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 2)
                    }
                    .padding(.horizontal)
                    SecureField("ConPass",
                      text: $conpassword ,
                      prompt: Text("Confirm Password").foregroundColor(.blue)
            )
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 2)
            }
            .padding(.horizontal)
            if userRegFailed {
                Text("User Registration Failed!")
                .padding()
                .foregroundColor(Color.red)
            }
            Spacer()
            
            Button {
                Task {
                    print("Registration btn clicked..", email, password)
                    inProgress = true;
                    do {
                        let url = URL(string: "http://18.117.101.153:3000/user")
                        if let url {
                            var request = URLRequest(url: url)
                            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                            request.httpMethod = "POST"
                            let encoder = JSONEncoder()
                            var userObj = User(email: self.email, name: self.name, password:self.password)
                            let data = try encoder.encode(userObj)
                            request.httpBody = data
                            let (responseData, response) = try await URLSession.shared.upload(for: request, from: data)
                            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
                            print("statusCode: \(response.statusCode)")
                            inProgress = false;
                            if(response.statusCode == 201 ){
                                print("User Registered");
                                userRegFailed = false
                            }else {
                                userRegFailed = true
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
                NavigationLink(destination: DashboardView().navigationBarBackButtonHidden(true) ) {
                   Text("Sign In")
                       .frame(maxWidth: .infinity)
                       .foregroundColor(.white)
                }
            }.padding()
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            //.disabled(name.isEmpty || email.isEmpty || password.isEmpty || conpassword.isEmpty)
                
            }.disabled(inProgress)
            Text("Already enrolled?")
            NavigationLink("Sign On Now", destination: LoginView().navigationBarBackButtonHidden(true))
            .foregroundColor(.blue)
            Spacer()
        }
    }

#Preview {
    SignInView()
}
