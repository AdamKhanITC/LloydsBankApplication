//
//  Cards.swift
//  PokemonCards
//
// Created by Adam on 04/06/2022
//

import Foundation

struct Card: Codable, Equatable, Identifiable {
  var id: String
  var name: String
  var hp: String?

  var images: Images

  init(
    id: String,
    name: String,
    hp: String? = nil,
    imageURLString: String,
    imageHDURLString: String
  ) {
    self.id = id
    self.name = name
    self.hp = hp
    self.images = Images(smallURLString: imageURLString,
                         largeURLString: imageHDURLString)
  }
}

struct Images: Codable, Equatable {
  var smallURLString: String
  var smallURL: URL? {
    URL(string: smallURLString)
  }

  var largeURLString: String
  var largeURL: URL? {
    URL(string: smallURLString)
  }

  enum CodingKeys: String, CodingKey {
    case smallURLString = "small"
    case largeURLString = "large"
  }
}

// MARK: Inits

extension Card {
  init(with favorite: FavoriteCard) {
    self.id = favorite.id ?? ""
    self.name = favorite.name ?? ""
    self.hp = favorite.hp
    self.images = Images(smallURLString: favorite.imageURL ?? "",
                         largeURLString: favorite.imageHDURL ?? "")
  }
}

// MARK: Mock

extension Card {
  static var mock1: Card {
    Card(
      id: "xy7-4",
      name: "Bellossom",
      hp: "120",
      imageURLString: "https://images.pokemontcg.io/xy7/4.png",
      imageHDURLString: "https://images.pokemontcg.io/xy7/4_hires.png"
    )
  }

  static var mock2: Card {
    Card(
      id: "ex16-1",
      name: "Aggron",
      hp: "110",
      imageURLString: "https://images.pokemontcg.io/ex16/1.png",
      imageHDURLString: "https://images.pokemontcg.io/ex16/1_hires.png"
    )
  }
}

// MARK: - Cards

struct Cards: Codable, Equatable, Identifiable {
  var id = UUID()
  var cards: [Card]

  enum CodingKeys: String, CodingKey {
    case cards = "data"
  }
}

// MARK: Mock

extension Cards {
  static var mock: Cards = .init(
    cards: [
      Card.mock1,
      Card.mock2
    ]
  )
}
