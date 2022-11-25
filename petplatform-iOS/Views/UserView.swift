//
//  UserView.swift
//  petplatform-iOS
//
//  Created by haksung on 2022/11/22.
//

import SwiftUI

struct UserView: View {
    var modelData: ModelData
    var user: User = User(userId: "hi", password: "1111")
    
    var body: some View {
        Button {
            self.user = User(userId: "haksung59", password: "1234")
        } label: {
            Text("로그인")
                .font(.system(size: 15))
                .animation(nil)
        }
        
    }
    
    //JSON 방식 호출
    func jsonAction(user: User) -> Void {
        
        let encoder = JSONEncoder()
        var paramData: Data
        do {
            paramData = try encoder.encode(user)
        }catch {
            fatalError("hi")
        }
        
        print("hi")
        
        //URL 객체 정의
        let url = URL(string: "http://localhost:8080/sign_in")
        
        //URLRequest 객체 정의
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        //HTTP 메시지 헤더
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        self.user = user
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(modelData: ModelData())
    }
}
