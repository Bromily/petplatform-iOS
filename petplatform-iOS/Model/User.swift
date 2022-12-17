//
//  User.swift
//  petplatform-iOS
//
//  Created by haksung on 2022/11/22.
//

import Foundation

class User: Codable {
    
    var userId: String
    var password: String
    var nickName: String
    var name: String
    var birth: String
    var address: String
    var email: String
    var phoneNumber: String
    var userType: String
    
    static let `default` = User()
    
    init(){
        self.userId = ""
        self.password = ""
        self.nickName = ""
        self.name = ""
        self.birth = ""
        self.address = ""
        self.email = ""
        self.phoneNumber = ""
        self.userType = ""
    }
    
    class ResponseDto: Decodable{
        
        var elapsedTime: Int
        var status: String
        var errors: [String]
        var timestamp: String
        var bodyType: String
        var body: User
        
        init(response: ResponseDto){
            elapsedTime = response.elapsedTime
            status = response.status
            errors = response.errors
            timestamp = response.timestamp
            bodyType = response.bodyType
            body = response.body
        }
        
    }
    
    func signIn(user: User) async throws -> User {
        let encoder = JSONEncoder()
        var paramData: Data
        do {
            paramData = try encoder.encode(user)
        }catch {
            fatalError("check input data")
        }
        
        // URL 객체 정의
        let url = URL(string: "http://localhost:8080/api/signin")
        
        // URL Request 객체 정의
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        // HTTP 메시지 헤더
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData.count), forHTTPHeaderField: "Content-Length")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(ResponseDto.self, from: data)
        
        return response.body
    }
    
}
