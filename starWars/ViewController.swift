//
//  ViewController.swift
//  starWars
//
//  Created by Aizada on 28.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager.networkManager
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(StarWarsTableViewCell.self, forCellReuseIdentifier: StarWarsTableViewCell.identifier)
        return table
    }()
    
    
    var starWarsItems: [StarWarsItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchData(for: .people)
        fetchData(for: .planet)
    }
    
    func fetchData(for type: ReguestType) {
        networkManager.getData(type: type) { [weak self] items in
            guard let self = self else { return }
            
            if type == .people {
                self.starWarsItems = items
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else if type == .planet {
                self.starWarsItems = items
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWarsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StarWarsTableViewCell.identifier, for: indexPath) as! StarWarsTableViewCell
        
        let item = starWarsItems[indexPath.row]
        
        if let character = item.character {
            cell.nameLabel.text = "Name: \(character.name)"
            cell.genderLabel.text = "Gender: \(character.gender)"
            cell.massLabel.text = "Mass: \(character.mass)"
        } else if let planet = item.planet {
            cell.planetNameLabel.text = "Planet Name: \(planet.name)"
            cell.populationLabel.text = "Population: \(planet.population)"
            cell.diameterLabel.text = "Diameter: \(planet.diameter)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
}

