//
//  CoffeeCell.swift
//  TeosCoffee
//
//  Created by Nico Molina on 08/09/2023.
//

import Foundation
import SDWebImage
import UIKit

private let reuseIdentifier = "CoffeeCell"

class CoffeeCell: UITableViewCell {
    
    var coffee: Coffee? {
        didSet {
            configure()
        }
    }
    
    //get values from viewmodel
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title text"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let coffeImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.setDimensions(width: 90, height: 90)
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        //var url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/A_small_cup_of_coffee.JPG/1200px-A_small_cup_of_coffee.JPG")
        //coffeImageView.sd_setImage(with: url)
        

        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(valueLabel)
        addSubview(coffeImageView)
        
        
        //coffeImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        //coffeImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        coffeImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        coffeImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: coffeImageView.topAnchor, constant: 2).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: coffeImageView.rightAnchor, constant: 8).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: coffeImageView.rightAnchor, constant: 8).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        valueLabel.leftAnchor.constraint(equalTo: coffeImageView.rightAnchor, constant: 8).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: coffeImageView.bottomAnchor, constant: -2).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        guard let coffee = coffee else { return }
        //setear coffee en el viewmodel let viewModel = TweetViewModel(tweet: tweet)
        
        titleLabel.text = coffee.title
        descriptionLabel.text = coffee.shortDescription
        coffeImageView.sd_setImage(with: coffee.imageUrl)
        
    }
}
