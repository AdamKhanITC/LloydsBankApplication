//
//  FavoriteCard+Utility.swift
//  PokemonCards
//
//  Created by Adam on 04/06/2022
//

import CoreData

extension FavoriteCard {
  static func instance(from card: Card, with context: NSManagedObjectContext) -> FavoriteCard {
    let newFavorite = FavoriteCard(context: context)
    newFavorite.id = card.id
    newFavorite.name = card.name
    newFavorite.hp = card.hp
    newFavorite.imageURL = card.images.smallURLString
    newFavorite.imageHDURL = card.images.largeURLString

    return newFavorite
  }
}
