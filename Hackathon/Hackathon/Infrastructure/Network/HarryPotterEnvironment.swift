//
//  HarryPotterEnvironment.swift
//  Hackathon
//
//  Created by Ricardo Dórame on 23/02/24.
//

struct HarryPotterEnvironment: Environment {
  let baseURL: String = APIConstants.baseURL
}

extension CharactersAPI {
  static var production: Self {
    CharactersAPI(environment: HarryPotterEnvironment())
  }
}
