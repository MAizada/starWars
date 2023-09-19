//
//  NetworkManager.swift
//  starWars
//
//  Created by Aizada on 17.09.2023.
//

import Foundation

class NetworkManager {
    
   static let networkManager = NetworkManager()
    
    let baseUrl = "https://swapi.dev/api/"
    
    func getData(type: ReguestType, completion: @escaping ([StarWarsItem]) -> () ) {
        
        var endPoint: String {
            switch type {
            case .people: return "people/"
            case .planet: return "planets/"
            }
        }
        guard let url = URL(string: baseUrl+endPoint) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                if type == .planet {
                    let planetResponse = try JSONDecoder().decode(PlanetResponse.self, from: data)
                    let items = planetResponse.results.map { StarWarsItem(character: nil, planet: $0) }
                    completion(items)
                } else {
                    let starWarsResponse = try JSONDecoder().decode(StarWarsResponse.self, from: data)
                    let items = starWarsResponse.results.map { StarWarsItem(character: $0, planet: nil) }
                    completion(items)
                }
                
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
    
}
