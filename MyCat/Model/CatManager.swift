//
//  CatManager.swift
//  MyCat
//
//  Created by Matheus on 07/01/22.
//

import Foundation

protocol CatManagerDelegate {
    func didUpdateCat(_ catManager: CatManager, cat: CatData)
    func loadImage(cat: CatData)
}
struct CatManager {
    var delegate: CatManagerDelegate?
}
