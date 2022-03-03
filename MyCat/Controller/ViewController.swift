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
  private var cats: [CatData] = []
  var tableView = UITableView()

  //MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()

    tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.backgroundColor = #colorLiteral(red: 0.04932049662, green: 0.3799920082, blue: 0.4390093386, alpha: 1)
    tableView.register(UINib(nibName: Setup.CatTableViewCell, bundle: nil), forCellReuseIdentifier: Setup.CatTableViewCell)
    view.addSubview(tableView)
    self.fetchData()
  }

  //MARK: - Methods
  private func fetchData() {
    Requests.makeRequest { [weak self] response in
      self?.cats = response
      self?.tableView.reloadData()
    }
  }
}


//MARK: -- UITableViewDelegate
extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let nextVC = CatViewController()
    nextVC.cat = cats[indexPath.row]
    self.navigationController?.pushViewController(nextVC, animated: true)
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

