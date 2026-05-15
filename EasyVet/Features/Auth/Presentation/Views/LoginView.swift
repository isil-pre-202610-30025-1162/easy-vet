//
//  LoginView.swift
//  EasyVet
//
//  Created by Jorge Mayta on 9/04/26.
//

import SwiftUI

struct LoginView: View {
    
    @State private var showMain: Bool = false
    @State var email = ""
    @State var password = ""
    
    var body: some View {
    
        VStack {
            OutlinedTextField(title: "Email", text: $email)
                
            SecureTextField(title: "Password", text: $password)
                
            FilledButton(text: "Login") {
                showMain.toggle()
            }
        }
        .navigationDestination(isPresented: $showMain) {
            MainView()
                
        }
        
    }
}


#Preview {
    LoginView()
}
