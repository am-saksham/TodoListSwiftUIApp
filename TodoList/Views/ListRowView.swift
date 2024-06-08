//
//  ListRowView.swift
//  TodoList
//
//  Created by Saksham Gupta on 08/06/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}
#Preview {
    ListRowView(item: ItemModel(title: "First title!", isCompleted: false))
}
