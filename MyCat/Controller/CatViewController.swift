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
    var catManager = CatManager()
    
    @IBOutlet weak var catNameLabel: UILabel!
    @IBOutlet weak var catDescriptionLabel: UILabel!
    @IBOutlet weak var catTempLabel: UILabel!
    @IBOutlet weak var catImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catManager.delegate = self
        
        self.didUpdateCat(catManager, cat: cat)
    }
    
 

}

//MARK: -- CatManagerDelegate

extension CatViewController: CatManagerDelegate {
    
    //Atualiza todos os labels da tela secundaria com o gato selecionado
    func didUpdateCat(_ catManager: CatManager, cat: CatData) {
        self.catNameLabel.text = cat.name
        self.catTempLabel.text = "Temperamento: "+(cat.temperament)
        self.catDescriptionLabel.text = cat.description
        
        self.catNameLabel.layer.cornerRadius = catNameLabel.frame.size.height / 5
        self.catDescriptionLabel.layer.cornerRadius = catDescriptionLabel.frame.size.height / 5
        self.catTempLabel.layer.cornerRadius = catTempLabel.frame.size.height / 3
        
        self.loadImage(cat: self.cat)
    }
    
    
    //Carrega a imagem com o Pod SDWebImage
    func loadImage(cat: CatData) {
        if let urlString = self.cat.image?.url{
            if let url = URL(string: urlString){
                let placeholder = UIImage(named: "catImage")
                self.catImageView.sd_setImage(with: url, placeholderImage: placeholder, options: [])
            }
        }
    }
    
    
}
