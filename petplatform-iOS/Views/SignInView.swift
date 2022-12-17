//
//  TestView.swift
//  petplatform-iOS
//
//  Created by haksung on 2022/11/23.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var user: User = .default
    
    var body: some View {
        if(user.userId == ""){
            NavigationView {
                VStack() {
                    HStack(){
                        Text("ID")
                            .frame(width: 40, alignment: .center)
                        TextField("아이디", text: $user.userId)
                            .border(.gray)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 160, alignment: .leading)
                    }
                    .frame(width: 200, height: 40, alignment: .center)
                    
                    HStack(){
                        Text("PW")
                            .frame(width: 40, alignment: .center)
                        SecureField("비밀번호", text: $user.password)
                            .border(.gray)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 160, alignment: .leading)
                    }
                    .frame(width: 200, height: 40, alignment: .center)
                    
                    VStack {
                        HStack {
                            NavigationLink(
                                destination: SignUpView(),
                                label: {
                                    Text("Sign-up")
                                })
                            
                            Spacer()
                            
                            Button(action: {
                                Task {
                                    do{
                                        user = try await user.signIn(user: user)
                                    }catch {
                                        user = User()
                                    }
                                }
                            }, label: {
                                Text("Sign-in")
                            })
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.roundedRectangle(radius: 7))
                            .frame(alignment: .leading)
                        }
                        .frame(width: 165, alignment: .center)
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Forgot your ID/PW?")
                                .font(.system(size: 11))
                                .underline()
                        })
                    }
                }
            }
        }else {
            MainView(user: user)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        SignInView()
            .environmentObject(ModelData())
    }
}
