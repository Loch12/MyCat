//
//  CatTableViewCell.swift
//  MyCat
//
//  Created by Matheus on 05/01/22.
//

import UIKit

class CatTableViewCell: UITableViewCell {
  //MARK: -- Properties
  static let identifier = "CatTableViewCell"

  var catViewModel: CatViewModel! {
    didSet {
      catName.text = catViewModel.name
    }
  }

  private let catName: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = #colorLiteral(red: 0.2160000056, green: 0.7450000048, blue: 0.6899999976, alpha: 1)
    label.font = UIFont(name: "Helvetica", size: 30)
    label.textAlignment = .center
    label.layer.masksToBounds = true
    label.layer.cornerRadius = 30
    return label
  }()

  // MARK: -- Override Methods
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(catName)
    self.backgroundColor = .clear
    applyConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  //MARK: -- Methods
  private func applyConstraints() {
    let catNameConstraints = [
      catName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      catName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
      catName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      catName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
      catName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
    ]

    NSLayoutConstraint.activate(catNameConstraints)
  }
}
