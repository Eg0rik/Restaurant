//
//  MenuSectionListView.swift
//  Restaurant
//
//  Created by MAC on 4/7/24.
//

import SwiftUI

struct MenuSectionsHorizontalView: View {
    
    private let imageWidth: CGFloat = 120
    private let imageHeight: CGFloat = 70
    
    @EnvironmentObject private var vm:MenuViewModel
    
    var body: some View {
        
        ScrollView(.horizontal,showsIndicators: false) {
            
            HStack(spacing:15) {
                
                ForEach(vm.sectionArray,id: \.menuID) { menuSection in
                    
                    Button {
                        vm.menuIDCurrent = menuSection.menuID
                    } label: {
                        VStack(spacing:15) {
                            //
                            //                        Button {
                            //                            vm.uploadImage()
                            //                        } label: {
                            //                            Text("load")
                            //                        }
                            //
                            //                        VStack {
                            //                            vm.image
                            //                                .resizable()
                            //                                .aspectRatio(contentMode: .fit)
                            //                        }
                            //                        .frame(width: 100, height:100)
                            //                        .background(.blue)
                                
                            AsyncImage(url: getImageURL(menuSection.imageURL)) { phase in
                                
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(height: imageHeight)
                                        .frame(width:imageWidth)
                                        .clipped()
                                    
                                } else if phase.error != nil {
                                    
                                    Text(phase.error?.localizedDescription ?? "error")
                                        .foregroundColor(Color.pink)
                                        .frame(height: imageHeight)
                                        .frame(width:imageWidth)
                                } else {
                                    ProgressView()
                                        .frame(height: imageHeight)
                                        .frame(width:imageWidth)
                                }
                            }
                            
                            Text("\(menuSection.name)")
                            Text("\(menuSection.count) товаров")
                                .padding(.bottom,10)
                        }
                        .foregroundStyle(.white)
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
            .padding(.leading,15)
        }
    }
    
    private func getImageURL(_ path:String) -> URL? {
        Endpoint.image(imagePath: path).url
    }
}

#Preview {
    MenuView()
}
