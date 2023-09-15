//
//  MenuFilterViewModel.swift
//  TeosCoffee
//
//  Created by Nico Molina on 08/09/2023.
//

import Foundation
import UIKit

enum MenuFilterOptions: Int, CaseIterable {
    case hot = 0
    case cold = 1
    case other = 2
    
    var description: String {
        switch self {
        case .hot: return "Hot Coffee"
        case .cold: return "Cold Coffee"
        case .other: return "Others"
        }
    }
}

struct CofffeeViewModel {
    
    let coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }

    var coffeeTitle: String {
        return "\(coffee.title)"
    }
    
    var coffeeImage: URL? {
        return coffee.imageUrl
    }
    
    var coffeeValue: String {
        return "\(coffee.value)"
    }
    
    var coffeeDescription: String {
        return "\(coffee.description)"
    }
    
    var coffeeRating: Int {
        return coffeeRating
    }
    
    
}

