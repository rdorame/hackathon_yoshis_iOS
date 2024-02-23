//
//  CharactersAPI.swift
//  Hackathon
//
//  Created by Ricardo Dórame on 23/02/24.
//

import Foundation

// MARK: CharactersAPI struct
struct CharactersAPI {
  let environment: Environment
  
  init(environment: Environment) {
    self.environment = environment
  }
}

// MARK: - CharactersAPI
extension CharactersAPI {
  var charactersURL: URL { getURL(path: APIConstants.Endpoints.characters) }
  
  func charactersByIDURL(id: String) -> URL {
    return getURL(path: "\(APIConstants.Endpoints.characters)/\(id)")
  }
  
  func charactersHouseURL(house: House) -> URL {
    return getURL(path: "\(APIConstants.Endpoints.charactersHouse)/\(house.rawValue.lowercased())")
  }
  
  func charactersByCharacterTypeURL(characterType: CharacterType) -> URL {
    return getURL(path: "\(APIConstants.Endpoints.characters)/\(characterType.rawValue.lowercased())")
  }
}

// MARK: - Helpers
fileprivate extension CharactersAPI {
  func getURL(path: String) -> URL {
    URL(string: "\(environment.baseURL)/\(path)")!
  }
}
