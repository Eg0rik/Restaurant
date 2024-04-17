//
//  LoadingView.swift
//  Restaurant
//
//  Created by MAC on 4/3/24.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        VStack(spacing: 20)  {
            
            Image("roflan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:150)
            ProgressView()
            Text("Getting the menu ...")
                .foregroundColor(.gray)
        }
    }
}


#Preview {
    LoadingView()
}
