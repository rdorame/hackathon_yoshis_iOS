//
//  Constants.swift
//  Hackathon
//
//  Created by Ricardo Dórame on 23/02/24.
//

import Foundation

// MARK: APIConstants struct
struct APIConstants {
  static let baseURL: String = Bundle.main.object(forInfoDictionaryKey: "BASEURL") as? String ?? String()
  
  // MARK: - Endpoints struct
  struct Endpoints {
    static let characters: String = Bundle.main.object(forInfoDictionaryKey: "CHARACTERS") as? String ?? String()
    static let charactersHouse: String = "\(characters)/house"
  }
}
