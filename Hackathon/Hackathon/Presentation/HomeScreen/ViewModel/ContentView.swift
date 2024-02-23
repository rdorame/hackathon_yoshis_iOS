//
//  ContentView.swift
//  Hackathon
//
//  Created by Ricardo Dórame on 23/02/24.
//

import SwiftUI

struct ContentView: View {
  private var viewModel: CharactersViewModel!
  
  init() {
    
  }
  
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
    }
    .padding()
  }
  
  fileprivate func makeRepository() -> CharactersRepository {
    CharactersAPIRepository(
      httpClient: URLSessionHTTPClient(),
      api: .production
    )
  }
  
  fileprivate func makeViewModel(
    repository: CharactersRepository,
    onSuccess: @escaping (_ characterID: String) -> Void,
    onError: @escaping (_ errorMessage: String) -> Void
  ) -> CharactersViewModel {
    CharactersViewModel(
      repository: repository,
      onSuccess: onSuccess,
      onError: onError
    )
  }
  
  // MARK: - Binding
  func onSuccess(id: String) {
    print(Self.self, #function, id)
  }
  
  func onError(errorMessage: String) {
    print(Self.self, #function, errorMessage)
  }
}

#Preview {
  ContentView()
}
