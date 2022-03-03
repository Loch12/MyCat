//
//  CatViewController.swift
//  MyCat
//
//  Created by Matheus on 06/01/22.
//

import UIKit
import SDWebImage

class CatViewController: UIViewController {

//MARK: -- Labels
  let textView: UIView = {
    let textView = UIView()
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.backgroundColor = #colorLiteral(red: 0.2156862745, green: 0.7450980392, blue: 0.6901960784, alpha: 1)

    textView.layer.masksToBounds = true
    textView.layer.cornerRadius = 20
    return textView
  }()

  let catImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  let catNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = #colorLiteral(red: 0.04932049662, green: 0.3799920082, blue: 0.4390093386, alpha: 1)

    label.font = UIFont(name: "Helvetica", size: 30)
    label.textAlignment = .center

    label.layer.masksToBounds = true
    label.layer.cornerRadius = 7



    return label
  }()

  let catDescriptionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = #colorLiteral(red: 0.04932049662, green: 0.3799920082, blue: 0.4390093386, alpha: 1)

    label.font = UIFont(name: "Trebuchet MS Negrito", size: 18)
    label.textAlignment = .center
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byWordWrapping

    label.layer.masksToBounds = true
    label.layer.cornerRadius = 7
    label.sizeToFit()

    return label
  }()

  let catTempLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = #colorLiteral(red: 0.04932049662, green: 0.3799920082, blue: 0.4390093386, alpha: 1)

    label.font = UIFont(name: "Trebuchet MS Negrito", size: 18)
    label.textAlignment = .center
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byWordWrapping

    label.layer.masksToBounds = true
    label.layer.cornerRadius = 7
    label.sizeToFit()

    return label
  }()

  //MARK: - Properties
  var cat: CatData!
  var catManager = CatManager()

  //MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.04932049662, green: 0.3799920082, blue: 0.4390093386, alpha: 1)
    catManager.delegate = self
    view.addSubview(catImageView)
    view.addSubview(textView)

    textView.addSubview(catNameLabel)
    textView.addSubview(catDescriptionLabel)
    textView.addSubview(catTempLabel)


    loadImage(cat: self.cat)
    setLayout()
    applyConstraints()
  }

  //MARK: - Methods
  func setLayout() {
    catNameLabel.text = cat.name
    catTempLabel.text = "Temperamento: "+(cat.temperament)
    catDescriptionLabel.text = cat.description

  }

  private func applyConstraints() {

    let catNameLabelConstraints = [
      catNameLabel.topAnchor.constraint(equalTo: textView.topAnchor, constant: 20),
      catNameLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 20),
      catNameLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: -20),


    ]

    let catTempLabelConstraints = [
      catTempLabel.topAnchor.constraint(equalTo: catDescriptionLabel.bottomAnchor, constant: 20),
      catTempLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 20),
      catTempLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: -20),
    ]

    let catDescriptionLabelConstraints = [
      catDescriptionLabel.topAnchor.constraint(equalTo: catNameLabel.bottomAnchor, constant: 20),
      catDescriptionLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 20),
      catDescriptionLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: -20),
    ]

    let catImageViewConstraints = [
      catImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      catImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
      catImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      catImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 220)
    ]

    let textViewConstraints = [
      textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
      textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
      textView.topAnchor.constraint(equalTo: catImageView.bottomAnchor, constant: 50),
      textView.bottomAnchor.constraint(equalTo: catTempLabel.bottomAnchor, constant: 20)
    ]

    NSLayoutConstraint.activate(textViewConstraints)
    NSLayoutConstraint.activate(catImageViewConstraints)
    NSLayoutConstraint.activate(catNameLabelConstraints)
    NSLayoutConstraint.activate(catDescriptionLabelConstraints)
    NSLayoutConstraint.activate(catTempLabelConstraints)
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
    } else {
      self.catImageView.image = UIImage(named: Setup.defaultImage)
    }
  }
}
