//
//  CatTableViewCell.swift
//  MyCat
//
//  Created by Matheus on 05/01/22.
//

import UIKit

class CatTableViewCell: UITableViewCell {

    @IBOutlet weak var catNameLabel: UILabel!
    
    var cat: CatData! {
        didSet{
            self.catNameLabel.text = self.cat.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        catNameLabel.layer.cornerRadius = catNameLabel.frame.size.height / 5
    }
    
    
    
    
}
