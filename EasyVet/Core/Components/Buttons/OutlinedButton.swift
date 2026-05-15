//
//  OutlinedButton.swift
//  EasyVet
//
//  Created by Jorge Mayta on 23/04/26.
//

import SwiftUI

struct OutlinedButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundStyle(.green)
                .padding()
                .frame(maxWidth: .infinity)
        }
        .overlay(RoundedRectangle(cornerRadius: 24).stroke(.green, lineWidth: 2))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .padding(.horizontal, 8)
    }
}
