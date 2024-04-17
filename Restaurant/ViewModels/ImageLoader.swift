////
////  ImageLoader.swift
////  Restaurant
////
////  Created by MAC on 4/12/24.
////
//
import Foundation
import SwiftUI

final class ImageLoader:ObservableObject {
    var image:Image?
}

//final class ImageLoader:ObservableObject {
//    
//    var image:Image?
//    private let networkingService = NetworkingService.shared
//    
//    @Published var dataState = DataState.loading
//    
//    func fetchImage(path:String) {
//        dataState = .loading
//        
//        //MARK: change logic
//        networkingService.dataTask(.image(imagePath: path), type: , completion: ) { [unowned self] result in
//            DispatchQueue.main.async {
//                
//                switch result {
//                    case .success(let localURL):
//                        
//                        do {
//                            let data = try Data(contentsOf: localURL)
//                            
//                            guard let uiImage = UIImage(data: data) else {
//                                self.dataState = .error(APIError.customError(description: "nil uiImage"))
//                                return
//                            }
//                            
//                            self.image = Image(uiImage: uiImage)
//                            self.dataState = .success
//                            
//                        } catch let error {
//                            self.dataState = .error(APIError.customError(description: error.localizedDescription))
//                            print(error)
//                        }
//                        
//                    case .failure(let error):
//                        self.dataState = .error(error)
//                        print(error)
//                }
//            }
//        }
//    }
//    
//    func setDataState(_ state:DataState) {
//            dataState = state
//    }
//    
//    //MARK: preview helpers
//    static func errorState() -> SubMenuViewModel {
//        let fetcher = SubMenuViewModel()
//        fetcher.setDataState(.error(APIError.url(URLError.init(.notConnectedToInternet))))
//        return fetcher
//    }
//    
////    static func successState() -> SubMenuViewModel {
////        let fetcher = SubMenuViewModel()
////        fetcher.subMenu = SubMenu.example1()
////        return fetcher
////    }
//}
