//
//  ItemModel.swift
//  TodoList
//
//  Created by Saksham Gupta on 08/06/24.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
