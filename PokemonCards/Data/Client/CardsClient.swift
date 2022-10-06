//
//  CardsClient.swift
//  PokemonCards
//
//  Created by Adam on 04/06/2022
//

import ComposableArchitecture

struct CardsClient {
  var page: (_ number: Int, _ size: Int) -> Effect<Cards, ProviderError>
}

// MARK: - Live

extension CardsClient {
  static let live = CardsClient(
    page: { number, size in
      Provider.shared
        .cardsPage(number: number, size: size)
        .eraseToEffect()
    }
  )
}

// MARK: - Mock

extension CardsClient {
  static func mock(
    all: @escaping (Int, Int) -> Effect<Cards, ProviderError> = { _, _ in
      fatalError("Unmocked")
    }
  ) -> Self {
    Self(
      page: all
    )
  }

  static func mockPreview(
    all: @escaping (Int, Int) -> Effect<Cards, ProviderError> = { _, _ in
      .init(value: Cards.mock)
    }
  ) -> Self {
    Self(
      page: all
    )
  }
}
