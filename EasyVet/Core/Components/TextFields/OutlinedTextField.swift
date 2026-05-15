//
//  OutlinedTextField.swift
//  EasyVet
//
//  Created by Jorge Mayta on 23/04/26.
//

import SwiftUI

struct OutlinedTextField: View {
    let title: String
    @Binding var text: String
    
    var body: some View {
        TextField(title, text: $text)
            .padding()
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal)
    }
}
