//
//  CoffeListView.swift
//  TeosCoffee
//
//  Created by Nico Molina on 08/09/2023.
//

import Foundation
import UIKit

private let reuseIdentifier = "CoffeeCell"

class CoffeeListView: UITableView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        tableView.register(CoffeeCell.self, forCellReuseIdentifier: reuseIdentifier)
//        tableView.dataSource = self
//        tableView.delegate = self
        
        //backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//extension MainViewController: UITableViewDelegate {
//
//}
//
//extension MainViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
//        
//        return cell
//    }
//}
