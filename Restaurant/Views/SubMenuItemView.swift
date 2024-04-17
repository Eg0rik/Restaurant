//
//  SubMenuItemView.swift
//  Restaurant
//
//  Created by MAC on 3/31/24.
//

import SwiftUI

struct SubMenuItemView: View {
    private let item:Dish
    
    init(subMenuItem:Dish) {
        item = subMenuItem
    }
    
    var body: some View {
        VStack(spacing:15) {
            
//            if let image = vm.image {
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(height:100)
//            }
            Text("\(item.name)")
            Text("\(item.content)")
            Text("\(item.price)")
                .padding(.bottom,10)
        }
        .foregroundStyle(.white)
        .background(.gray)
        .clipShape(RoundedRectangle(cornerRadius: 10))
//        .onAppear {
//            vm.uploadImage()
//        }
    }
}


