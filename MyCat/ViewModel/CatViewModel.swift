//
//  CatViewModel.swift
//  MyCat
//
//  Created by UpperSoft on 07/03/22.
//

import Foundation
import UIKit

struct CatViewModel {

  let name: String
  let temp: String
  let description: String
  let imageURL: String?

  init(cat: CatData){
    self.name = cat.name
    self.temp = cat.temperament
    self.description = cat.description
    self.imageURL = cat.image?.url
  }

}
