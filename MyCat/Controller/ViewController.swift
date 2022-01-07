//
//  ViewController.swift
//  MyCat
//
//  Created by Matheus on 05/01/22.
//url: https://api.thecatapi.com/v1/breeds
//key: 842c54ee-add1-4eab-9747-f2fd69603dde
//+ "?api_key=842c54ee-add1-4eab-9747-f2fd69603dde"

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController {
    
    private var cats: [CatData] = []
    
    private var url = "https://api.thecatapi.com/v1/breeds?api_key=842c54ee-add1-4eab-9747-f2fd69603dde"
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "CatTableViewCell", bundle: nil), forCellReuseIdentifier: "CatTableViewCell")
        
        self.fetchData()
        
    }
    
    
    //Requisição com AlamoFire
    private func fetchData() {
        AF.request(self.url , method: .get).responseDecodable(of: [CatData].self) { [weak self] response in
            self?.cats = response.value ?? []
            self?.tableView.reloadData()
        }
    }


}


//MARK: -- UITableViewDelegate

extension ViewController: UITableViewDelegate {
    //Definindo ações para cada celula
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    //Define o destino e envia o objeto selecionado para a proxima pagina
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CatViewController{
            destination.cat = cats[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
}


//MARK: -- UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CatTableViewCell", for: indexPath) as? CatTableViewCell {
            cell.cat = self.cats[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

