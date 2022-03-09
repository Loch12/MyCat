//
//  Routes.swift
//  MyCat
//
//  Created by UpperSoft on 09/02/22.
//

import Foundation

struct Routes {
  static let apiURL = "https://api.thecatapi.com/v1"
  static let apiKey = "842c54ee-add1-4eab-9747-f2fd69603dde"
  
  enum APIRoutes {
    case breeds
  }
  
  static func getAPIUrl(requestRoute: APIRoutes) -> String {
    switch requestRoute {
      case .breeds:
        return "\(Routes.apiURL)/breeds?api_key=\(Routes.apiKey)"
    }
  }
}
