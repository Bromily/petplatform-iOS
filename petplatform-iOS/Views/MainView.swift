//
//  MainView.swift
//  petplatform-iOS
//
//  Created by haksung on 2022/12/05.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var modelData: ModelData
    @State var user: User
    
    var body: some View {
        Text(user.userId)
    }
}

struct MainView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        MainView(user: User())
            .environmentObject(modelData)
    }
}
