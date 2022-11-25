//
//  TestView.swift
//  petplatform-iOS
//
//  Created by haksung on 2022/11/23.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var user: User = .default
    
    var body: some View {
        VStack {
            Button(action: {
                Task {
                    print(user.userId)
                    user = try await user.signIn(user: User(userId: "haksung59", password: "1234"))
                    print(user.userId)
                }}, label: {
                    Text($user.userId.wrappedValue)
                })
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        TestView()
            .environmentObject(ModelData())
    }
}
