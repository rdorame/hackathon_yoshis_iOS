//
//  CharacterError.swift
//  Hackathon
//
//  Created by Ricardo Dórame on 23/02/24.
//

import Foundation

// MARK: CharacterError enum
enum CharacterError: Error {
  case fetchError(Error)
  case notParsable(Data)
}
