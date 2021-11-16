//
//  ImageViewController.swift
//  RickandMortyApi
//
//  Created by Arthur Lee on 06.08.2021.
//

import UIKit

class ImageViewController: UIViewController {
    
    private let imageUrl = "https://wallpapercave.com/wp/wp4560013.jpg"

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        activityIndicator.startAnimating()
        fetchImage()
        activityIndicator.hidesWhenStopped = true
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    private func fetchImage() {
        guard let url = URL(string: imageUrl) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) {
            (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let response = response {
                print(response)
            }
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.imageView.image = image
                }
            }
        }.resume()
    }

}
