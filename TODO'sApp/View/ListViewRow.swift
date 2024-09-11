//
//  ListViewRow.swift
//  TODOApp
//
//  Created by Mohamed Shendy on 04/09/2024.
//

import SwiftUI


struct ListViewRow: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
        }
    }
    
    
}



#Preview {
    let item1 = ItemModel(title: "first", isCompleted: false)
       return  ListViewRow(item: item1)
}
