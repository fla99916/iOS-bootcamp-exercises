//
//  ContentView.swift
//  YelimCard
//
//  Created by Yelim Kim on 20/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 1.00, green: 0.92, blue: 0.65)
                .ignoresSafeArea()
            VStack {
                Image("Mango")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 175, height: 175)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.black, lineWidth: 3))
                Text("Yelim Kim")
                    .font(Font.custom("MochiyPopPOne-Regular", size: 40))
                    .bold()
                .foregroundColor(.mint)
                Text("iOS developer")
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                
                Divider()
                
                Text("+34 647 177 263")
                    .foregroundColor(.accentColor)
                    .font(Font.custom("MochiyPopPOne-Regular", size: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.black, lineWidth: 3)
                            .frame(width: 400, height: 40))
                
                
                InfoView(text: "+34 647 199 263", imageName: "phone")
                InfoView(text: "fla99916@gmail.com", imageName: "envelope")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

