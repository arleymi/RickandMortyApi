//
//  CharacterTableViewCell.swift
//  RickandMortyApi
//
//  Created by Arthur Lee on 10.08.2021.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    
 func configure(with character: Character) {
        nameLabel.text = character.name
        statusLabel.text = character.status
        speciesLabel.text = character.species
        genderLabel.text = character.gender
     
        
    
        DispatchQueue.global().async {
        guard let imageUrl = URL(string: character.image) else { return }
        guard let imageData = try? Data(contentsOf: imageUrl) else { return }
        
        DispatchQueue.main.async {
            self.characterImage.image = UIImage(data: imageData)
           }
        
        }
        
    }
    

    
}
