//
//  StarWarsTableViewCell.swift
//  starWars
//
//  Created by Aizada on 28.08.2023.
//

import UIKit

class StarWarsTableViewCell: UITableViewCell {

    static let identifier: String = "StarWarsTableViewCell"

    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    let massLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()

    let planetNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    let populationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    let diameterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nameLabel)
        addSubview(genderLabel)
        addSubview(massLabel)
        addSubview(planetNameLabel)
        addSubview(populationLabel)
        addSubview(diameterLabel)

         nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
         nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
         genderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
         genderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
         massLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 5).isActive = true
         massLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        planetNameLabel.topAnchor.constraint(equalTo: massLabel.bottomAnchor, constant: 5).isActive = true
        planetNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        populationLabel.topAnchor.constraint(equalTo: planetNameLabel.bottomAnchor, constant: 5).isActive = true
        populationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        diameterLabel.topAnchor.constraint(equalTo: populationLabel.bottomAnchor, constant: 5).isActive = true
        diameterLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

