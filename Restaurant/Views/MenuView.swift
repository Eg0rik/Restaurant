//
//  MenuView.swift
//  Restaurant
//
//  Created by MAC on 3/30/24.
//

import SwiftUI

struct MenuView:View {
    @StateObject var vm = MenuViewModel()
    
    var body: some View {
        
        ScrollView {
            ZStack {
                Color.yellow
                
                VStack {
                    Text(vm.menuIDCurrent ?? "nil")
                    
                    switch vm.dataState {
                        case .error:
                            ErrorView(dataState: $vm.dataState)
                        case .loading:
                            LoadingView()
                        case .success:
                            MenuSectionsHorizontalView()
                                .environmentObject(vm)
                    }
                    
                    SubMenuView()
                        .environmentObject(vm)
                    
                    Spacer()
                }
                
            }
        }
    }
}



#Preview {
    MenuView()
}
