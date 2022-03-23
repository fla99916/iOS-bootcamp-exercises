//
//  InfoView.swift
//  YelimCard
//
//  Created by Yelim Kim on 20/1/22.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white.opacity(0.5))
            .frame(height: 50)
            .overlay(HStack{
                Image(systemName: imageName).foregroundColor(.purple)
                Text(text)
            })
            .padding(.all)
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", imageName: "phone")
            .previewLayout(.sizeThatFits)
    }
}
