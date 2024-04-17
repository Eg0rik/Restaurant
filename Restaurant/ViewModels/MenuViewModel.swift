//
//  MenuFetcher.swift
//  Restaurant
//
//  Created by MAC on 4/3/24.
//

import Foundation

final class MenuViewModel:ObservableObject {
    
    @Published var dataState = DataState.loading
    @Published var menuIDCurrent:String?
    @Published private(set) var menu:Menu?
    @Published private(set) var subMenu:SubMenu?
    
    private let networkingService = NetworkingService.shared
    
    var sectionArray:[MenuSection] {
        menu?.menuList ?? []
    }
    
    var dishArray:[Dish] {
        subMenu?.menuList ?? []
    }
    
    init() {
        fetchMenu()
    }
    
    func fetchMenu() {
        dataState = .loading
        
        networkingService.dataTask(.menu, type: Menu.self) { [unowned self] result in
            
            DispatchQueue.main.async {
                switch result {
                    case .success(let successMenu):
                        self.menu = successMenu
                        self.dataState = .success
                        self.menuIDCurrent = successMenu.menuList.first?.menuID
                        self.fetchSubMenu()
                    case .failure(let err):
                        self.dataState = .error(err)
                }
            }
        }
    }
    
    func fetchSubMenu() {
        if let menuIDCurrent {
            networkingService.dataTask(.subMenu(menuID: menuIDCurrent), type: SubMenu.self) { [unowned self] result in
                
                DispatchQueue.main.async {
                    switch result {
                        case .success(let successSubMenu):
                            self.subMenu = successSubMenu
                        case .failure(let err):
                            print(err)
                    }
                }
            }
        }
    }
    
//    //MARK: preview helpers
//    static func errorState() -> MenuViewModel {
//        let fetcher = MenuViewModel()
//        fetcher.setDataState(.error(APIError.url(URLError.init(.notConnectedToInternet))))
//        return fetcher
//    }
//    
//    static func successState() -> MenuViewModel {
//        let fetcher = MenuViewModel()
//        fetcher.menu = Menu.example1()
//        return fetcher
//    }
}
