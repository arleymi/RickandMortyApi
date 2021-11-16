//
//  ViewController.swift
//  RickandMortyApi
//
//  Created by Arthur Lee on 06.08.2021.
//

import UIKit

enum UserActions: String, CaseIterable {
    case showImage = "Rick and Morty Poster"
    case showCharacter = "One Character"
}

class MainViewController: UICollectionViewController {
    
    private let userActions = UserActions.allCases
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userActions.count
    }
   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
        cell.userActionLabel.text = userActions[indexPath.item].rawValue
        return cell
    }

    // MARK: UICOllectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .showImage:
            performSegue(withIdentifier: "ShowImage", sender: self)
        case .showCharacter:
            performSegue(withIdentifier: "ShowOneCharacter", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "ShowImage" {
            let charactersVC = segue.destination as! CharacterTableViewController
           
           
           switch segue.identifier {
           case "ShowOneCharacter":
               charactersVC.fetchData()
           default:
               break
           }
        }
        
    
    }
}

// MARK : Size of cell for all screen sizes.

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
