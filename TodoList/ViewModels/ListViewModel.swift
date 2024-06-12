//
//  ListViewModel.swift
//  TodoList
//
//  Created by Saksham Gupta on 12/06/24.
//

import Foundation

@Observable class ListViewModel {
    var items: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title: "This is the first title!", isCompleted: false),
//            ItemModel(title: "This is the second!", isCompleted: true),
//            ItemModel(title: "Third!", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        
//        guard let data = UserDefaults.standard.data(forKey: itemsKey) else {return}
//        guard let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {return}
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = saveItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItem() {
        if let endcodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(endcodedData, forKey: itemsKey)
        }
    }
}
