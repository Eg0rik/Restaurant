//
//  CustomList.swift
//  Restaurant
//
//  Created by MAC on 4/9/24.
//

import Foundation
import SwiftUI

struct CustomButton:View {
    private let cell_height:CGFloat = 240
    private let cell_width:CGFloat = 170
    let dish:Dish
    
    private let networkingService = NetworkingService.shared
    var url:URL? {
        Endpoint.image(imagePath: dish.image).url
    }
    
    
    var body: some View {
        
        Button {
            
        } label: {
            
            VStack {
                
                VStack(spacing:10) {
                    Text(dish.name)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    
                    Text(dish.content)
                        .fontWeight(.thin)
                        .lineLimit(2)
                        .padding(.horizontal,15)
                        .font(.system(size: 14))
                    
                    Text("\(dish.price)$")
                        .fontWidth(.condensed)
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                }
                .padding(.top,5)
                .frame(height: cell_height/2)
                
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                } placeholder: {
                    ProgressView("loading")
                }
//                MyImageView(url: getURL.imageURL(path: dish.image))
//                    .frame(height: cell_height/2)
//                    .onAppear {
//                        print(getURL.imageURL(path: dish.image)?.path(percentEncoded: false) ?? "nil")
//                    }
            }
            .frame(width:cell_width,height: cell_height)
            .foregroundStyle(.white)
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct SubMenuTable:View {
    
    private let imageWidth: CGFloat = 120
    private let imageHeight: CGFloat = 110
    
    @EnvironmentObject private var vm:MenuViewModel
    
    private let flexibleColumns = [
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200))
    ]
    
    var body: some View {
        
        LazyVGrid(columns: flexibleColumns,spacing: 20) {
            
            ForEach(vm.dishArray,id:\.id) { dish in
                CustomButton(dish: dish)
            }
        }
    }
}

#Preview {
    MenuView()
}
