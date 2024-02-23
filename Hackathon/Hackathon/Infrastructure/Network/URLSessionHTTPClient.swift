//
//  URLSessionHTTPClient.swift
//  Hackathon
//
//  Created by Ricardo Dórame on 23/02/24.
//

import Foundation

// MARK: URLSessionHTTPClient class
public final class URLSessionHTTPClient: HTTPClient {
  private let session: URLSession
  
  public init(session: URLSession = URLSession.shared) {
    self.session = session
  }
  
  // MARK: - HTTP Client usage
  public func get(_ url: URL?, responseHandler: @escaping (ResponseResult) -> Void) {
    guard let endpoint: URL = url else { return }
    session.dataTask(with: endpoint) { data, response, error in
      let handledResponse: Result<Data,URLSessionHTTPClientError> = Self.handle(
        data: data,
        error: error,
        response: response)
      switch handledResponse {
        case .success(let _data):
          responseHandler(.success(_data))
        case .failure(let _error):
          responseHandler(.failure(_error))
      }
    }.resume()
  }
}

// MARK: - URLSessionHTTPClient Response handlers
extension URLSessionHTTPClient {
  internal static func handle(
    data: Data?,
    error: Error?,
    response: URLResponse?
  ) -> Result<Data,URLSessionHTTPClientError> {
    if let _data: Data = data,
       error == nil,
       let _response: URLResponse = response,
       let _: HTTPURLResponse = _response as? HTTPURLResponse
    {
      return .success(_data)
    }
    
    if let _error = error {
      return .failure(.error(_error))
    }
    
    return .failure(.unknown(data, response, error))
  }
}
