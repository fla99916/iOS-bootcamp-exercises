//
//  PostData.swift
//  H4X0R News
//
//  Created by Yelim Kim on 25/1/22.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let url: String?
    let title: String
    
}
