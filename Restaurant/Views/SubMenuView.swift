//
//  SubMenuView.swift
//  Restaurant
//
//  Created by MAC on 3/31/24.
//

import SwiftUI

struct SubMenuView: View {
    
    @EnvironmentObject private var vm:MenuViewModel
    
    //MARK: to separate view
    private let imageWidth: CGFloat = 120
    private let imageHeight: CGFloat = 70
    
    var body: some View {
        
        VStack {
            
            Button {
                vm.fetchSubMenu()
            } label: {
                Text("refresh")
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    vm.fetchSubMenu()
                }
            }
            
            SubMenuTable()
        }
        
        //                    VStack {
        //                        Button {
//                            
//                        } label: {
//                            VStack(spacing:15) {
//                                //
//                                //                        Button {
//                                //                            vm.uploadImage()
//                                //                        } label: {
//                                //                            Text("load")
//                                //                        }
//                                //
//                                //                        VStack {
//                                //                            vm.image
//                                //                                .resizable()
//                                //                                .aspectRatio(contentMode: .fit)
//                                //                        }
//                                //                        .frame(width: 100, height:100)
//                                //                        .background(.blue)
//                                
//                                if dish.imageURL != nil {
//                                    
//                                    AsyncImage(url: getURL.imageURL(path: dish.imageURL)) { phase in
//                                        
//                                        if let image = phase.image {
//                                            image
//                                                .resizable()
//                                                .scaledToFill()
//                                                .frame(height: imageHeight)
//                                                .frame(width:imageWidth)
//                                                .clipped()
//                                            
//                                        } else if phase.error != nil {
//                                            
//                                            Text(phase.error?.localizedDescription ?? "error")
//                                                .foregroundColor(Color.pink)
//                                                .frame(height: imageHeight)
//                                                .frame(width:imageWidth)
//                                        } else {
//                                            ProgressView()
//                                                .frame(height: imageHeight)
//                                                .frame(width:imageWidth)
//                                        }
//                                    }
//                                }else {
//                                    Color
//                                        .gray
//                                        .frame(height: imageHeight)
//                                        .frame(width:imageWidth)
//                                }
//                                Text(dish.description)
//                                Text("\(dish.price)$")
//                                    .padding(.bottom,10)
//                            }
//                            .foregroundStyle(.white)
//                            .background(.gray)
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                        }
////                    }
    }
}

#Preview {
    MenuView()
}
