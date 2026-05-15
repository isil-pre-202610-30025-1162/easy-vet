//
//  SecureTextField.swift
//  EasyVet
//
//  Created by Jorge Mayta on 30/04/26.
//

import SwiftUI

struct SecureTextField: View {
    let title: String
    @Binding var text: String
    @State private var isSecure = true
    
    var body: some View {
        
        HStack {
            Group {
                
                if isSecure {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
                Button {
                    isSecure.toggle()
                } label: {
                    Image(systemName: isSecure ? "eye.slash" : "eye")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .tint(.gray)
                }

            }
            
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
        
            
    }
}
