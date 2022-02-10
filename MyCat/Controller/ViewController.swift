//
//  ViewController.swift
//  MyCat
//
//  Created by Matheus on 05/01/22.

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController {

  @IBOutlet private weak var tableView: UITableView!

  //MARK: - Properties
  private var cats: [CatData] = []

  //MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()

    self.tableView.delegate = self
    self.tableView.dataSource = self

    self.tableView.register(UINib(nibName: Setup.CatTableViewCell, bundle: nil), forCellReuseIdentifier: Setup.CatTableViewCell)

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
    if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Setup.CatViewController) as? CatViewController {
      vc.cat = cats[indexPath.row]
      present(vc, animated: false, completion: nil)
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

