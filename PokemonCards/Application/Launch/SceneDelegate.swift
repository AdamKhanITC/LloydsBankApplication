//
//  SceneDelegate.swift
//  PokemonCards
//
// Created by Adam on 04/06/2022
//

import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    let mainView = MainView(
      store: .init(
        initialState: .init(),
        reducer: mainReducer,
        environment: .init(
          cardsClient: .live,
          favoriteCardsClient: .live,
          mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
          uuid: UUID.init
        )
      )
    )

    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = UIHostingController(rootView: mainView)
      self.window = window
      window.makeKeyAndVisible()
    }
  }
}
