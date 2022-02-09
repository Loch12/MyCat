//
//  ViewController.swift
//  MyCat
//
//  Created by Matheus on 05/01/22.

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController {
    
    private var cats: [CatData] = []
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: Setup.CatTableViewCell, bundle: nil), forCellReuseIdentifier: Setup.CatTableViewCell)
        
        self.fetchData()
        
    }
    
    private func fetchData() {
        AF.request(Setup.apiURL , method: .get).responseDecodable(of: [CatData].self) { [weak self] response in
            self?.cats = response.value ?? []
            self?.tableView.reloadData()
        }
    }


}


//MARK: -- UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Setup.showDetails, sender: self)
    }
    
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: Setup.CatTableViewCell, for: indexPath) as? CatTableViewCell {
            cell.cat = self.cats[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

