////
////  ImageLoadingView.swift
////  Restaurant
////
////  Created by MAC on 4/12/24.
////
//
import Foundation
import SwiftUI

struct MyImageView:View {
    
    var body: some View {
        VStack {
            
        }
    }
    
}

//struct MyImageView:View {
//    
//    @StateObject var imageLoader = ImageLoader()
//    var url:URL?
//    
//    //    init(url:URL?) {
//    //        self._imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
//    //    }
//    
//    var body: some View {
//        VStack {
//            
//            Button("refresh") {
//                imageLoader.fetchImage(url: url)
//            }
//            
//            switch imageLoader.dataState {
//                case .loading:
//                    ProgressView("loading")
//                case .error:
//                    ErrorView(dataState: $imageLoader.dataState)
//                case .success:
//                    if let image = imageLoader.image {
//                        image
//                            .resizable()
//                            .scaledToFill()
//                            .clipped()
//                    }
//            }
//        }
//        .onAppear {
//            imageLoader.fetchImage(url: url)
//        }
//    }
//}
//
//#Preview {
//    VStack {
//        MyImageView(url: URL(string: "https://vkus-sovet.ru///upload//iblock//78b//78b05a510583a30c82ddb5d5c94ce73d.jpeg"))
//    }
//    .frame(width:170,height:170)
//}
