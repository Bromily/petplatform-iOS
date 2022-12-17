//
//  SignUpView.swift
//  petplatform-iOS
//
//  Created by haksung on 2022/12/05.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var modelData: ModelData
    @State var user: User = .default
    
    var body: some View {
        Text("회원가입")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        SignUpView()
            .environmentObject(modelData)
    }
}
