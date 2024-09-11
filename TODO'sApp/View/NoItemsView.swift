//
//  NoItems.swift
//  TODOApp
//
//  Created by Mohamed Shendy on 08/09/2024.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    let secoundaryaccentColor = Color("secoundaryaccentColor")
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("Ther are no items!")
                    .font(.title)
                    .fontWeight(.semibold)

                Text("are you productive person? ithinnkyou need to click add button to and add a bunch of items to your todo list ")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddItemView(),label: {
                    
                    Text("Add some thing 🥳")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secoundaryaccentColor : Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? secoundaryaccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: 10,
                        x: 0.0,
                        y:  animate ? 10 : 20)
                .scaleEffect(y: animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                

            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimating)
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity )
    }
    
    func addAnimating(){
        /*
         because onAppear() call every time the view appear we must check
         beafore animation
         */
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationStack{
        NoItemsView()
            .navigationTitle("title")
    }
}
