//
//  ListViewModel.swift
//  TODOApp
//
//  Created by Mohamed Shendy on 05/09/2024.
//

import Foundation


class ListViewModel: ObservableObject {

    @Published var items: [ItemModel]  = [] {
        /*
         we call this func there instead of call it at the end of CURD function
         i need to  save  data every time i set the items array
         for best practices i call it one insted of repeate my self
                  */
        didSet {
            saveItems()
        }
    }
    
    var itemsKey: String = "saved_Items"
    
    
    init() {
        getItems()
    }
    
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
      
        self.items =  saveItems
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
        
    }
    func moveItem(from: IndexSet,to: Int ){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] =  item.updateCompletio()
        }
    }
   /*
    to save custom data model like ItemModel to userDefaults we must convert it to jason data  (bolo data)
    so the custo data model must conform to Codable Protocol to encode and decode data
    encode : - transform data model to jso data
    decode :- retrive  dada back from json data to custom data model
    */
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
        
    }
    
}
