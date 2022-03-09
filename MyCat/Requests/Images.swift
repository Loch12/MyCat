//
//  Images.swift
//  MyCat
//
//  Created by UpperSoft on 09/03/22.
//

import Foundation
import UIKit

class Images {
  static func loadImage(cat: CatViewModel, catImageView: UIImageView) {
    if let urlString = cat.imageURL {
      if let url = URL(string: urlString){
        let placeholder = UIImage(named: "catImage")
        catImageView.sd_setImage(with: url, placeholderImage: placeholder, options: [])
      }
    } else {
      catImageView.image = UIImage(named: Setup.defaultImage)
    }
  }
}
