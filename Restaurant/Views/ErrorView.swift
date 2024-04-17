//
//  ErrorView.swift
//  Restaurant
//
//  Created by MAC on 4/7/24.
//

import SwiftUI

struct ErrorView: View {
    
    @Binding var dataState:DataState
    
    var body: some View {
        Text(dataState.descriptoin)
    }
}

#Preview {
    MenuView()
}
