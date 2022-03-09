//
//  ViewController.swift
//  MyCat
//
//  Created by Matheus on 05/01/22.

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController {
  
  //MARK: - Properties
  private var catViewModels: [CatViewModel] = []
  
  private let tableView: UITableView = {
    let table = UITableView()
    table.register(CatTableViewCell.self, forCellReuseIdentifier: CatTableViewCell.identifier)
    return table
  }()
  
  //MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(tableView)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.backgroundColor = #colorLiteral(red: 0.04932049662, green: 0.3799920082, blue: 0.4390093386, alpha: 1)
    
    self.fetchData()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }

  //MARK: - Methods
  private func fetchData() {
    Requests.makeRequest { [weak self] response in
      self?.catViewModels = response.map({return CatViewModel(cat: $0)})
      self?.tableView.reloadData()
    }
  }

}

//MARK: -- UITableViewDelegate
extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let nextVC = CatViewController()
    nextVC.catViewModel = catViewModels[indexPath.row]
    self.navigationController?.pushViewController(nextVC, animated: true)
  }
}


//MARK: -- UITableViewDataSource
extension ViewController: UITableViewDataSource { 
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.catViewModels.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CatTableViewCell.identifier, for: indexPath) as? CatTableViewCell else {
      return UITableViewCell()
    }
    let catViewModel = catViewModels[indexPath.row]
    cell.catViewModel = catViewModel
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
}

