//
//  FilledButton.swift
//  EasyVet
//
//  Created by Jorge Mayta on 23/04/26.
//

import SwiftUI

struct FilledButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
           action()
        } label: {
            
            Text(text)
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
             
        }
        .background(.green)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .padding(.horizontal, 8)
    }
}
