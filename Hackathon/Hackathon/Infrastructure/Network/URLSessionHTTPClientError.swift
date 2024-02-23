//
//  URLSessionHTTPClientError.swift
//  Hackathon
//
//  Created by Ricardo Dórame on 23/02/24.
//

import Foundation

// MARK: URLSessionHTTPClientError enum
public enum URLSessionHTTPClientError: Error {
  case error(Error)
  case unknown(Data?, URLResponse?, Error?)
}
