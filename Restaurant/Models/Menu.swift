//
//  last.swift
//  Restaurant
//
//  Created by MAC on 3/8/24.
//
import Foundation

struct Menu: Decodable {
   
    private let status: Bool
    let menuList: [MenuSection]
    
    init(status: Bool, menuItems: [MenuSection]) {
        self.status = status
        self.menuList = menuItems
    }
    
    static func example1() -> Menu {
        Menu(status: true, menuItems: [])
    }
    
//    //MARK: don't find
//    static func example2() -> Menu? {
//        
//        if let path = Bundle.main.path(forResource: "MenuTest", ofType: "json") {
//            
//            do {
//                let url = URL(fileURLWithPath: path)
//                let data = try Data(contentsOf: url)
//                
//                // Преобразовать данные в объекты Swift
//                let decodedData = try JSONDecoder().decode(Menu.self, from: data)
//                return decodedData
//            } catch {
//                print("Ошибка при чтении файла: \(error)")
//                return nil
//            }
//        } else {
//            print("Файл не найден")
//            return nil
//        }
//    }
    
//    func copy(sourceURL:URL) {
//            
//            //куда сохранить
//            let destinationURL = URL(fileURLWithPath: "/Users/mac/Desktop/swiftUI/dop.json")
//
//            do {
//                let fileManager = FileManager.default
//                
//                guard fileManager.fileExists(atPath: sourceURL.path) else {
//                    print("Файл по исходному пути не существует")
//                    return
//                }
//                
//                try fileManager.copyItem(at: sourceURL, to: destinationURL)
//                print("Файл успешно скопирован в новое место")
//            } catch {
//                print("Ошибка при копировании файла: \(error)")
//            }
//
//        }
//        
//        func save() {
//            
//            let encoder = JSONEncoder()
//            encoder.outputFormatting = .prettyPrinted // для красивого форматирования
//            
//            do {
//                let jsonData = try encoder.encode(arr)
//                // Теперь у вас есть данные в формате JSON (jsonData)
//                // Можете сохранить их в файл
//                
//                // Путь к директории документов
//                let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//                let fileURL = documentsDirectory.appendingPathComponent("people.json")
//
//                do {
//                    try jsonData.write(to: fileURL)
//                    print("Data saved to \(fileURL)")
//                    
//                    copy(sourceURL: fileURL)
//                } catch {
//                    print("Error writing data to file: \(error)")
//                }
//
//                
//            } catch {
//                print("Error encoding data: \(error)")
//            }
//        }
}
