//
//  CatViewController.swift
//  MyCat
//
//  Created by Matheus on 06/01/22.
//

import UIKit
import SDWebImage

class CatViewController: UIViewController {

    var cat: CatData!
    
    @IBOutlet weak var catNameLabel: UILabel!
    @IBOutlet weak var catDescriptionLabel: UILabel!
    @IBOutlet weak var catTempLabel: UILabel!
    @IBOutlet weak var catImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }
    
    //Carregando todos os labels
    func loadData() {
        catNameLabel.text = cat.name
        catTempLabel.text = "Temperamento: "+(cat.temperament)
        catDescriptionLabel.text = cat.description
        
        catNameLabel.layer.cornerRadius = catNameLabel.frame.size.height / 5
        catDescriptionLabel.layer.cornerRadius = catDescriptionLabel.frame.size.height / 5
        catTempLabel.layer.cornerRadius = catTempLabel.frame.size.height / 3
        
        loadImage()
    }
    
    //SDWebImage carregando a imagem do gato selecionado
    func loadImage() {
        if let urlString = cat.image?.url{
            if let url = URL(string: urlString){
                let placeholder = UIImage(named: "catImage")
                self.catImageView.sd_setImage(with: url, placeholderImage: placeholder, options: [])
            }
        }
    }
 

}
