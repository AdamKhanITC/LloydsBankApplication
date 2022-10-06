//
//  Environment.swift
//  PokemonCards
//
//  Created by Adam on 04/06/2022
//

import Foundation

public enum Environment {
  // MARK: Keys

  enum ConfigKey {
    static let apiURL = "API_URL"
    static let apiVersion = "API_VERSION"
    static let apiKey = "API_KEY"
  }

  // MARK: Plist

  private static let infoDictionary: [String: Any] = {
    guard let dict = Bundle.main.infoDictionary else {
      fatalError("Plist file not found")
    }
    return dict
  }()

  // MARK: Plist values

  static let apiURL: URL = {
    guard let apiURL = Environment.infoDictionary[ConfigKey.apiURL] as? String else {
      fatalError("API URL not set in plist for this environment")
    }
    guard let url = URL(string: apiURL) else {
      fatalError("API URL is invalid")
    }
    return url
  }()

  static let apiVersion: String = {
    guard let apiVersion = Environment.infoDictionary[ConfigKey.apiVersion] as? String else {
      fatalError("API Version not set in plist for this environment")
    }

    return apiVersion
  }()

  static let apiKey: String = {
    guard let apiKey = Environment.infoDictionary[ConfigKey.apiKey] as? String else {
      fatalError("API Key not set in plist for this environment")
    }

    return apiKey
  }()
}
