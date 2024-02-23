//
//  CharactersViewModel.swift
//  Hackathon
//
//  Created by Ricardo Dórame on 23/02/24.
//

// MARK: CharactersViewModel class
final class CharactersViewModel {
  private let repository: CharactersRepository
  
  private let onSuccess: (_ characterID: String) -> Void
  private let onError: (_ errorMessage: String) -> Void
  
  init(
    repository: CharactersRepository,
    onSuccess: @escaping (_ characterID: String) -> Void,
    onError: @escaping (_ errorMessage: String) -> Void
  ) {
    self.repository = repository
    self.onSuccess = onSuccess
    self.onError = onError
  }
  
  func fetchAllCharacters() {
    repository.getAll { [unowned self] result in
      switch result {
        case .success(let data):
          self.onSuccess(data.id)
        case .failure(let error):
          self.onError(error.localizedDescription)
      }
    }
  }
  
  func fetchCharactersByID(id: String) {
    repository.getByID(id: id, handler: { [unowned self] result in
      switch result {
        case .success(let data):
          self.onSuccess(data.id)
        case .failure(let error):
          self.onError(error.localizedDescription)
      }
    })
  }
  
  func fetchCharactersByHouse(house: House) {
    repository.getByHouse(house: house, handler: { [unowned self] result in
      switch result {
        case .success(let data):
          self.onSuccess(data.id)
        case .failure(let error):
          self.onError(error.localizedDescription)
      }
    })
  }
  
  func fetchCharactersByCharacterType(characterType: CharacterType) {
    repository.getByCharacterType(characterType: characterType, handler: { [unowned self] result in
      switch result {
        case .success(let data):
          self.onSuccess(data.id)
        case .failure(let error):
          self.onError(error.localizedDescription)
      }
    })
  }
}
