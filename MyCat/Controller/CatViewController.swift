//
//  CatViewController.swift
//  MyCat
//
//  Created by Matheus on 06/01/22.
//

import UIKit
import SDWebImage

class CatViewController: UIViewController {

  @IBOutlet weak var catNameLabel: UILabel!
  @IBOutlet weak var catDescriptionLabel: UILabel!
  @IBOutlet weak var catTempLabel: UILabel!
  @IBOutlet weak var catImageView: UIImageView!

//MARK: - Properties
  var cat: CatData!
  var catManager = CatManager()

//MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    catManager.delegate = self
    setLayout()
    loadImage(cat: self.cat)

  }

//MARK: - Methods
  func setLayout() {
    catNameLabel.text = cat.name
    catTempLabel.text = "Temperamento: "+(cat.temperament)
    catDescriptionLabel.text = cat.description

    catNameLabel.layer.cornerRadius = catNameLabel.frame.size.height / 5
    catDescriptionLabel.layer.cornerRadius = catDescriptionLabel.frame.size.height / 5
    catTempLabel.layer.cornerRadius = catTempLabel.frame.size.height / 3
  }

}

//MARK: -- CatManagerDelegate

extension CatViewController: CatManagerDelegate {
  func loadImage(cat: CatData) {
    if let urlString = self.cat.image?.url{
      if let url = URL(string: urlString){
        let placeholder = UIImage(named: "catImage")
        self.catImageView.sd_setImage(with: url, placeholderImage: placeholder, options: [])
      }
    }
  }
}
