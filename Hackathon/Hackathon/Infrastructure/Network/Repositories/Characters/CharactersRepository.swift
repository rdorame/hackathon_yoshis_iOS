//
//  CharactersRepository.swift
//  Hackathon
//
//  Created by Ricardo Dórame on 23/02/24.
//

// MARK: CharactersRepository protocol
protocol CharactersRepository {
  typealias CharacterResult = Result<CharacterData, CharacterError>
  func getAll(handler: @escaping (CharacterResult) -> Void)
  func getByID(id: String, handler: @escaping (CharacterResult) -> Void)
  func getByCharacterType(characterType: CharacterType, handler: @escaping (CharacterResult) -> Void)
  func getByHouse(house: House, handler: @escaping (CharacterResult) -> Void)
}
