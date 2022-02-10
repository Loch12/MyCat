//
//  Requests.swift
//  MyCat
//
//  Created by UpperSoft on 09/02/22.
//

import Foundation
import Alamofire

class Requests {
  static func makeRequest(completion: @escaping ([CatData]) -> Void) {
    AF.request(Setup.apiURL , method: .get).responseDecodable(of: [CatData].self) { response in
      if let data = response.value {
        completion(data)
      }
    }
  }
}
