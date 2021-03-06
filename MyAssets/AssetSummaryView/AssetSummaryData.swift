//
//  AssetSummaryData.swift
//  MyAssets
//
//  Created by David Yoon on 2021/12/14.
//

import SwiftUI

class AssetSummaryData: ObservableObject {
    @Published var assets: [Asset] = load("assets.json")
    
    
}


func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError(fileName + "을 찾을 수 없습니다.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError(fileName + "을 찾을 수 없습니다.")
    }
    
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError(fileName + "을 \(T.self)로 파싱할 수 없습니다.")
    }
}
