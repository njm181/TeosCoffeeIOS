//
//  Coffee.swift
//  TeosCoffee
//
//  Created by Nico Molina on 08/09/2023.
//

import Foundation

struct Coffee {
    let title: String
    let description: String
    let shortDescription: String
    let value: String
    var imageUrl: URL?
    let rating: Int
    
    init(dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
        self.shortDescription = dictionary["shortDescription"] as? String ?? ""
        self.value = dictionary["value"] as? String ?? ""
        self.rating = dictionary["rating"] as? Int ?? 0
        if let imageUrlString = dictionary["imageUrl"] as? String {
            guard let url = URL(string: imageUrlString) else {return}
            self.imageUrl = url
        }
    }
}
