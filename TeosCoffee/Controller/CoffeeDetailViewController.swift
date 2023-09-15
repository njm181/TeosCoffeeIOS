//
//  CoffeeDetailController.swift
//  TeosCoffee
//
//  Created by Nico Molina on 14/09/2023.
//

import Foundation
import UIKit

class CoffeeDetailViewController: UIViewController {
    
    private var coffee: Coffee
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "baseline_arrow_back_white_24dp")
        button.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
        
    }()
    
    private let coffeeImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let uiView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addtoCartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add to cart", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.brown.cgColor
        button.layer.borderWidth = 1.25
        button.setTitleColor(.brown, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.heightAnchor.constraint(equalToConstant: 36).isActive = true
        return button
    }()
    
    private let ratingImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "favorito"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 20, height: 20)
        return iv
    }()
    
    init(coffee: Coffee) {
        self.coffee = coffee
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()

    }
    
    @objc func handleDismiss(){
        print("go back")
        self.dismiss(animated: true)
    }
    
    private func configureUI(){
        titleLabel.text = coffee.title
        descriptionLabel.text = coffee.description
        valueLabel.text = "$\(coffee.value)"
        coffeeImageView.sd_setImage(with: coffee.imageUrl)
        let screenHeight = UIScreen.main.bounds.height
        let halfScreenHeight = screenHeight / 2.0
        
        
        view.addSubview(coffeeImageView)
        coffeeImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        coffeeImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        coffeeImageView.heightAnchor.constraint(equalToConstant: halfScreenHeight).isActive = true
        
        view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:  -16).isActive = true
        backButton.leftAnchor.constraint(equalTo: coffeeImageView.leftAnchor, constant: 16).isActive = true
        
        
        view.addSubview(uiView)
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.topAnchor.constraint(equalTo: coffeeImageView.bottomAnchor, constant: -16).isActive = true
        uiView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        uiView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        uiView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        uiView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: uiView.topAnchor, constant: 22).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: uiView.leftAnchor, constant: 22).isActive = true
        
        
        var stackRating = UIStackView()
        
        stackRating.axis = .horizontal
        stackRating.alignment = .leading
        stackRating.distribution = .fill
        stackRating.spacing = 4
        stackRating.translatesAutoresizingMaskIntoConstraints = false
        stackRating.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        for _ in 1...coffee.rating {
            print("RAING IS \(coffee.rating)")
            let imageView = UIImageView(image: UIImage(named: "favorito"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.setDimensions(width: 30, height: 30)
            stackRating.addArrangedSubview(imageView)
        }
        
        
        uiView.addSubview(stackRating)
        
        stackRating.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        stackRating.leftAnchor.constraint(equalTo: uiView.leftAnchor, constant: 22).isActive = true
        
        uiView.addSubview(descriptionTitleLabel)
        descriptionTitleLabel.topAnchor.constraint(equalTo: stackRating.bottomAnchor, constant: 16).isActive = true
        descriptionTitleLabel.leftAnchor.constraint(equalTo: uiView.leftAnchor, constant: 22).isActive = true

        uiView.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: uiView.leftAnchor, constant: 22).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: uiView.rightAnchor, constant: -22).isActive = true
        
        let stackButtons = UIStackView(arrangedSubviews: [valueLabel, addtoCartButton])
        stackButtons.axis = .horizontal
        stackButtons.spacing = 10
        stackButtons.distribution = .fill
        stackButtons.alignment = .fill
        stackButtons.translatesAutoresizingMaskIntoConstraints = false
        uiView.addSubview(stackButtons)
        stackButtons.bottomAnchor.constraint(equalTo: uiView.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        stackButtons.leftAnchor.constraint(equalTo: uiView.leftAnchor, constant: 22).isActive = true
        stackButtons.rightAnchor.constraint(equalTo: uiView.rightAnchor, constant: -22).isActive = true
        
        addtoCartButton.widthAnchor.constraint(equalTo: stackButtons.widthAnchor, multiplier: 0.5).isActive = true
    }
}
