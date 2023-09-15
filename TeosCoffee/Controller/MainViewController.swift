//
//  MainViewController.swift
//  TeosCoffee
//
//  Created by Nico Molina on 08/09/2023.
//

import UIKit

private let reuseIdentifier = "CoffeeCell"

class MainViewController: UIViewController {
    
    private var selectedFilter: MenuFilterOptions = .hot {
        didSet {
            tableView.reloadData()
        }
    }
    private var hotCoffees = [Coffee]()
    private var coldCoffees = [Coffee]()
    private var othersCoffees = [Coffee]()
    
    private var currentDataSource: [Coffee] {
        switch selectedFilter {
        case .hot: return hotCoffees
        case .cold: return coldCoffees
        case .other: return othersCoffees
        }
    }
    
    private let tableView = UITableView()
    
    private let mainImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "coffee_main"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
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
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        hotCoffees = CoffeeService.shared.getHotCoffees()
        coldCoffees = CoffeeService.shared.getIcedCoffee()
        othersCoffees = CoffeeService.shared.getOthersCoffee()
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!){
        if let value = MenuFilterOptions(rawValue: sender.selectedSegmentIndex) {
            switch value {
            case MenuFilterOptions.hot: selectedFilter = .hot
                case MenuFilterOptions.cold: selectedFilter = .cold
                case MenuFilterOptions.other: selectedFilter = .other
            }
        }
    }
    
    
    private func configureUI(){
        view.addSubview(mainImageView)
        mainImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 280).isActive = true

        titleLabel.attributedText = getInfoText()
        view.addSubview(titleLabel)
        titleLabel.bottomAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: -72).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: mainImageView.rightAnchor, constant: -16).isActive = true
        
        view.addSubview(uiView)
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: -32).isActive = true
        uiView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        uiView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        uiView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let mySegmentedControl = UISegmentedControl (items: ["Hot Coffee","Iced Coffee","Others"])
        let xPostion:CGFloat = 10
        let yPostion:CGFloat = 150
        let elementWidth:CGFloat = 300
        let elementHeight:CGFloat = 30
        
        mySegmentedControl.frame = CGRect(x: xPostion, y: yPostion, width: elementWidth, height: elementHeight)
        
        mySegmentedControl.selectedSegmentIndex = 0
        
        mySegmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        
        uiView.addSubview(mySegmentedControl)
        mySegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        mySegmentedControl.topAnchor.constraint(equalTo: uiView.topAnchor, constant: 8).isActive = true
        mySegmentedControl.rightAnchor.constraint(equalTo: uiView.rightAnchor, constant: -16).isActive = true
        mySegmentedControl.leftAnchor.constraint(equalTo: uiView.leftAnchor, constant: 16).isActive = true
        
        
        tableView.register(CoffeeCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        uiView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: mySegmentedControl.bottomAnchor, constant: 8).isActive = true
        tableView.leftAnchor.constraint(equalTo: uiView.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: uiView.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: uiView.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getInfoText() -> NSAttributedString {
        var infoText: NSAttributedString {
            let title = NSMutableAttributedString(string: "It's Great ",
                                                  attributes: [.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.white])
            title.append(NSAttributedString(string: "Day For\nCoffee.",
                         attributes: [.font: UIFont.boldSystemFont(ofSize: 18), .foregroundColor: UIColor.white]))
            
            return title
        }
        return infoText
    }
}

extension MainViewController: UITableViewDelegate {
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CoffeeCell
        cell.coffee = currentDataSource[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let controller = CoffeeDetailViewController(coffee: currentDataSource[indexPath.row])
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
}

