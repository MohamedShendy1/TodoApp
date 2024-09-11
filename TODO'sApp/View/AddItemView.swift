//
//  AddItemView.swift
//  TODOApp
//
//  Created by Mohamed Shendy on 04/09/2024.
//

import SwiftUI

struct AddItemView: View {
   
    @Environment(\.presentationMode) var presentaionMode
   
    @EnvironmentObject var listViewModel: ListViewModel
   
    @State var textFieldText: String = ""
    @State var alerttitle : String = ""
    @State var showAlert: Bool = false

    var body: some View {
        ScrollView{
            
            VStack {
                TextField("write any thing here ...", text: $textFieldText)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                .frame(height: 55)
                
                Button(action: {
                    saveButtonPressed()
                }, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10))
                    
                })
            }
            .padding(14)
            
        }
        .navigationTitle("Add new Item 🖋️ ")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func  saveButtonPressed() {
        if textIsAppropreate() {
            listViewModel.addItem(title: textFieldText)
            presentaionMode.wrappedValue.dismiss()
        }
    }
    
    
    func textIsAppropreate()-> Bool {
        if textFieldText.count < 3 {
            alerttitle = "Your new todo item must be at least 3 characters 😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    
    func getAlert()-> Alert {
        return Alert(title: Text(alerttitle))
    }
    
}

#Preview {
    NavigationStack{
        AddItemView()
    }.environmentObject(ListViewModel())
    .preferredColorScheme(.dark)

    
}
