//
//  DismissView.swift
//  Ecobici
//
//  Created by Nelson Gustavo Ek Perera on 16/12/23.
//

import SwiftUI

struct DismissView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack{
            Spacer()
            Image(systemName: "xmark")
                .resizable()
                .frame(width: 20,height: 20)
                .padding(.trailing,12)
                .onTapGesture {
                    dismiss()
                }
        }
    }
}

#Preview {
    DismissView()
}
