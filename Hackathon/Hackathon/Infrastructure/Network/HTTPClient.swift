//
//  HTTPClient.swift
//  Hackathon
//
//  Created by Ricardo Dórame on 23/02/24.
//

import Foundation

// MARK: HTTPClient protocol
public protocol HTTPClient {
  typealias ResponseResult = Result<Data, Error>
  func get(_ url: URL?, responseHandler: @escaping (ResponseResult) -> Void)
}
