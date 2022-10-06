//
//  Router+Cards.swift
//  PokemonCards
//
//  Created by Adam on 04/06/2022
//

import Foundation

extension Router {
  static func cardsPage(number: Int, size: Int) -> Route {
    return
      Route(
        path: "cards",
        queryItems: [
          .init(name: "page", value: "\(number)"),
          .init(name: "pageSize", value: "\(size)")
        ]
      )
  }
}
