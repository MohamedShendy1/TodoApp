//
//  ItemModel.swift
//  TODOApp
//
//  Created by Mohamed Shendy on 04/09/2024.
//

import Foundation


struct ItemModel: Identifiable, Codable{
    let id: String
    let title : String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    // mutating func
    func updateCompletio() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

