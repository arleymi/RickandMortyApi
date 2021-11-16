//
//  Character.swift
//  RickandMortyApi
//
//  Created by Arthur Lee on 06.08.2021.
//

struct Character: Decodable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let location: [String:String]
    let image: String
}
