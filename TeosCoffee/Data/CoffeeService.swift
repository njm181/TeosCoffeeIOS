//
//  CoffeeService.swift
//  TeosCoffee
//
//  Created by Nico Molina on 15/09/2023.
//

import Foundation

struct CoffeeService {
    static let shared = CoffeeService()
    
    func getHotCoffees() -> [Coffee]{
        return [Coffee(dictionary: ["title":"Americano", "rating": 3, "description":"An Americano is nothing more than an espresso to which hot water has been added or which has been diluted with hot water. The crema accumulates at the top, which allows you to enjoy a coffee drink with a longer lasting flavor, as it preserves the intensity of the coffee oils.", "value":"400.00", "imageUrl": "https://cdn.buttercms.com/AB7ud4YSE6nmOX0iGlgA", "shortDescription": "Espresso and hot water"]),
                      Coffee(dictionary: ["title":"Cappuccino", "rating": 4, "description":"A cappuccino is the perfect balance of espresso, steamed milk and foam. This coffee is all about the structure and the even splitting of all elements into equal thirds. An expertly made cappuccino should be rich, but not acidic and have a mildly sweet flavouring from the milk.", "value":"400.00", "imageUrl": "https://www.acouplecooks.com/wp-content/uploads/2021/12/Mocha-Cappuccino-004.jpg", "shortDescription":"Espresso, steamed milk and foam"]),
                      Coffee(dictionary: ["title":"Flat White", "rating": 5, "description":"What is a flat white coffee? A flat white is a blend of micro-foamed milk poured over a single or double shot of espresso. This microfoam is steamed milk infused with air, to create a smooth and velvety texture and creamy taste.", "value":"450.00", "imageUrl": "https://cbtl-images.s3.us-west-1.amazonaws.com/Production/Drupal/s3fs-public/styles/cafe_menu_item/public/cafe-menu/Flat_White_Hazelnut.jpg?itok=SFApZcve", "shortDescription": "Milk poured over a single or double shot of espresso"]),
                      Coffee(dictionary: ["title":"Latte Macchiato", "rating": 4, "description":"The spotted coffee or caffè macchiato in Italian, also called espresso macchiato, is a typical Italian coffee, consisting of an espresso with a small amount of hot and frothed milk. In Spain it is usually called café cortado.", "value":"380.00", "imageUrl": "https://baristaroyal.de/cdn/shop/articles/latte-macchiato-168805_1600x.jpg?v=1650957714", "shortDescription":"1-part milk, to 2-parts espresso"]),
                      Coffee(dictionary: ["title":"Mocha", "rating": 5, "description":"What is a mocha coffee? Although a mocha is often interpreted differently across the world, the basis is that a shot of espresso is combined with chocolate powder or syrup, followed by milk or cream. It is a variant of a latte, in the sense that it is often 1/3 espresso and 2/3 steamed milk.", "value":"450.00", "imageUrl": "https://i0.wp.com/gatherforbread.com/wp-content/uploads/2014/10/Dark-Chocolate-Mocha-Square.jpg?fit=1000%2C1000&ssl=1", "shortDescription":"A shot of espresso, chocolate, milk or cream"]),
                      Coffee(dictionary: ["title":"Espresso", "rating": 3, "description":"Espresso coffee is a form of coffee preparation that owes its name to the fact that this beverage is obtained through an espresso machine. It is characterized by its rapid preparation at high pressure and by a more concentrated flavor and texture.", "value":"420.00", "imageUrl": "https://www.thespruceeats.com/thmb/HJrjMfXdLGHbgMhnM0fMkDx9XPQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-is-espresso-765702-hero-03_cropped-ffbc0c7cf45a46ff846843040c8f370c.jpg", "shortDescription":"Dark-roast coffee packed tightly into a “puck”"])
        ]
    }
    
    func getIcedCoffee() -> [Coffee]{
        return [Coffee(dictionary: ["title":"Latte", "rating": 5, "description":"This is a test description 1", "value":"400.00", "imageUrl": "https://images.ctfassets.net/v601h1fyjgba/71VWCR6Oclk14tsdM9gTyM/6921cc6b21746f62846c99fa6a872c35/Iced_Latte.jpg", "shortDescription":"Ice, a splash of milk and rich espresso-like coffee from a stovetop brewer"]),
                       Coffee(dictionary: ["title":"Espresso", "rating": 4, "description":"This is a test description 2", "value":"400.00", "imageUrl": "https://www.thecookierookie.com/wp-content/uploads/2021/05/iced-espresso-recipe-2.jpg", "shortDescription":"Espresso served over ice, often with milk"]),
                       Coffee(dictionary: ["title":"Frappuccino", "rating": 4, "description":"This is a test description 3", "value":"400.00", "imageUrl": "https://thebusybaker.ca/wp-content/uploads/2020/05/easy-healthy-homemade-frappuccino-fb-ig-4-scaled.jpg", "shortDescription":"Coffee or espresso, milk, and ice"]),
                       Coffee(dictionary: ["title":"Mocha", "rating": 5, "description":"This is a test description 4", "value":"405.00", "imageUrl": "https://bakingmischief.com/wp-content/uploads/2019/05/iced-mocha-image-square.jpg", "shortDescription":"Iced latte with chocolate syrup added"])
        ]
    }
    
    func getOthersCoffee() -> [Coffee]{
        return [Coffee(dictionary: ["title":"Cortado", "rating": 4, "description":"This is a test description 1", "value":"400.00", "imageUrl": "https://perfectdailygrind.com/es/wp-content/uploads/sites/2/2020/03/Cortadito-1.png", "shortDescription":"Equal parts espresso and steamed milk"]),
                         Coffee(dictionary: ["title":"Irish", "rating": 5, "description":"This is a test description 2", "value":"400.00", "imageUrl": "https://www.acouplecooks.com/wp-content/uploads/2021/02/Irish-Coffee-005s.jpg", "shortDescription":"Hot coffee, Irish whiskey, sugar and whipped cream"]),
                         Coffee(dictionary: ["title":"Baileys", "rating": 5, "description":"This is a test description 3", "value":"430.00", "imageUrl": "https://www.homemadeinterest.com/wp-content/uploads/2021/02/Baileys-Irish-Coffee_IG-3.jpg", "shortDescription":"A spin on Irish coffee using Baileys Irish Cream instead of cream and sugar"])
        ]
    }
}
