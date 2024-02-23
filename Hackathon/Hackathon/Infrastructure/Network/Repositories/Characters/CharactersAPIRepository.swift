//
//  CharactersAPIRepository.swift
//  Hackathon
//
//  Created by Ricardo Dórame on 23/02/24.
//

import Foundation

// MARK: CharactersAPIRepository class
final internal class CharactersAPIRepository: CharactersRepository {
  private let httpClient: HTTPClient
  private let api: CharactersAPI
  
  internal init(httpClient: HTTPClient, api: CharactersAPI) {
    self.httpClient = httpClient
    self.api = api
  }
  
  // MARK: - CharactersRepository
  func getAll(handler: @escaping (CharacterResult) -> Void) {
    httpClient.get(api.charactersURL) { result in
      switch result {
        case .success(let data):
          if let dto: CharacterDTO = Self.parse(type: CharacterDTO.self, data: data) {
            handler(.success(dto.toData))
          } else {
            handler(.failure(.notParsable(data)))
          }
        case .failure(let error):
          handler(.failure(.fetchError(error)))
      }
    }
  }
  
  func getByID(id: String, handler: @escaping (CharacterResult) -> Void) {
    httpClient.get(api.charactersByIDURL(id: id)) { result in
      switch result {
        case .success(let data):
          if let dto: CharacterDTO = Self.parse(type: CharacterDTO.self, data: data) {
            handler(.success(dto.toData))
          } else {
            handler(.failure(.notParsable(data)))
          }
        case .failure(let error):
          handler(.failure(.fetchError(error)))
      }
    }
  }
  
  func getByCharacterType(characterType: CharacterType, handler: @escaping (CharacterResult) -> Void) {
    httpClient.get(api.charactersByCharacterTypeURL(characterType: characterType)) { result in
      switch result {
        case .success(let data):
          if let dto: CharacterDTO = Self.parse(type: CharacterDTO.self, data: data) {
            handler(.success(dto.toData))
          } else {
            handler(.failure(.notParsable(data)))
          }
        case .failure(let error):
          handler(.failure(.fetchError(error)))
      }
    }
  }
  
  func getByHouse(house: House, handler: @escaping (CharacterResult) -> Void) {
    httpClient.get(api.charactersURL) { result in
      switch result {
        case .success(let data):
          if let dto: CharacterDTO = Self.parse(type: CharacterDTO.self, data: data) {
            handler(.success(dto.toData))
          } else {
            handler(.failure(.notParsable(data)))
          }
        case .failure(let error):
          handler(.failure(.fetchError(error)))
      }
    }
  }
  
  private static func parse<T: Decodable>(type: T.Type, data: Data) -> T? {
    return try? JSONDecoder().decode(T.self, from: data)
  }
}

// MARK: CharacterDTO toData extension
fileprivate extension CharacterDTO {
  var toData: CharacterData {
    CharacterData(id: "9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8")
  }
}
