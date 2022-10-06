//
//  Provider+Cards.swift
//  PokemonCards
//
//  Created by Adam on 04/06/2022
//

import Combine
import Foundation

extension Provider {
  func cardsPage(number: Int, size: Int) -> AnyPublisher<Cards, ProviderError> {
    var request = URLRequest(url: Router.cardsPage(number: number, size: size).url!)
    request.httpMethod = "GET"

    return requestAuthorizedPublisher(request)
  }
}
