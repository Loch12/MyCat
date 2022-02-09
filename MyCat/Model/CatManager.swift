//
//  CatManager.swift
//  MyCat
//
//  Created by Matheus on 07/01/22.
//

import Foundation

protocol CatManagerDelegate {
    func loadImage(cat: CatData)
}
struct CatManager {
    var delegate: CatManagerDelegate?
}
