//
//  LoginView.swift
//  SlumberSense
//
//  Created by Saravanan Saminathan on 4/8/24.
//

import SwiftUI

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}

struct LoginView: View {
    @State var email: String = "sar762009@gmail.com"
    @State var password: String = "sara@123!"
    @State private var invalidUser = false
    @State private var isUserLogedin: Bool = false
    @State var inProgress = false
    
    
    var isSignInButtonDisabled: Bool {
        [email, password].contains(where: \.isEmpty)
    }
    
    var body: some View {
        NavigationStack {
            VStack(/*alignment: .leading, spacing: 15*/) {
                
                Text("Login")
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
                
                if invalidUser {
                    Text("Invalid Usser id/Password!")
                        .padding()
                        .foregroundColor(Color.red)
                }
                Spacer()
                Button {
                    Task {
                        print("Login btn clicked..", email, password)
                        inProgress = true;
                        do {
                            var url = URL(string: "http://18.117.101.153:3000/login")
                            url?.append(queryItems: [URLQueryItem(name: "email", value: self.email),URLQueryItem(name: "password", value: self.password)])
                            let (data, _) = try await URLSession.shared.data(from: url!)
                            let decodedResponse = try? JSONDecoder().decode(User.self, from: data)
                            if decodedResponse != nil {
                                print(decodedResponse?.name);
                                self.invalidUser = false;
                                //                                  self.isUserLogedin = true;
                                print(self.isUserLogedin);
                                inProgress = false;
                            }else {
                                self.invalidUser = true;
                                self.isUserLogedin = false;
                                print("Invalid user id/password")
                                print(self.isUserLogedin);
                                inProgress = false;
                            }
                        }catch{
                            inProgress = false;
                            print(error)
                        }
                    }
                } label: {
                    NavigationLink(destination: DashboardView().navigationBarBackButtonHidden(true), isActive: self.$isUserLogedin ) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                    }
                    
                }.padding()
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                
                
            }.disabled(inProgress)
            Spacer()
            Text("Don't have an account?")
            NavigationLink("Sign up here", destination: SignInView().navigationBarBackButtonHidden(true))
                .foregroundColor(.blue)
            Spacer()
            
        }
        
    }
}

#Preview {
    LoginView()
}

struct User: Codable {
    let email: String
    let name: String
    let password : String
}
