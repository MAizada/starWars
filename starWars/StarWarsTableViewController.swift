//
//  StarWarsTableViewController.swift
//  starWars
//
//  Created by Aizada on 11.09.2023.
//

import UIKit

class StarWarsTableViewController: UITableViewController {

        var characters: [People] = [] // Здесь будут храниться персонажи

        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Вызов функции для загрузки данных о персонажах
            fetchCharacters()
        }

        // Функция для загрузки данных о персонажах
        func fetchCharacters() {
            // Здесь вы можете использовать вашу собственную логику для выполнения запроса к API Star Wars
            // и получения данных о персонажах и их планетах.
            // Результаты запроса добавьте в массив characters и обновите таблицу.
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return characters.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)
            let character = characters[indexPath.row]
            cell.textLabel?.text = character.name
            cell.detailTextLabel?.text = "Gender: \(character.gender), Starships: \(character.mass)"
            return cell
        }

        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedCharacter = characters[indexPath.row]
            
            // Создайте контроллер для отображения информации о планете
            let planetViewController = ViewController(planet: selectedCharacter.planets)
            
            // Перейдите на экран с информацией о планете
            self.navigationController?.pushViewController(planetViewController, animated: true)
        }
    }

