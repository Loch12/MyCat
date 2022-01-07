//
//  CatData.swift
//  MyCat
//
//  Created by Matheus on 05/01/22.
//

//Estrutura que receberá o JSON através do request do AlamoFire

import Foundation

struct CatData: Decodable {
    let name: String
    let temperament: String
    let description: String
    let image: Image?
    
}

struct Image: Codable{
    let url: String?
}


