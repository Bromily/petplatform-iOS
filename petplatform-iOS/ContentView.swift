//
//  ContentView.swift
//  petplatform-iOS
//
//  Created by haksung on 2022/11/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var user: User = .default
    
    var body: some View {
        if(user.userId == ""){
            SignInView()
        }else {
            MainView(user: user)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
