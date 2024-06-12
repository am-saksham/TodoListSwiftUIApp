//
//  ListView.swift
//  TodoList
//
//  Created by Saksham Gupta on 08/06/24.
//

import SwiftUI

struct ListView: View {
    
    @Environment(ListViewModel.self) var listViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        })
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
    .environment(ListViewModel())
}
