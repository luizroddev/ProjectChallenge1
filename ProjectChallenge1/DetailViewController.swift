//
//  DetailViewController.swift
//  ProjectChallenge1
//
//  Created by Luiz R on 31/12/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    @objc
    func shareTapped(_ sender: UIButton) {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else { return print("No image found")
        }
        
        guard let imageName = selectedImage else { return print("No image name found")}
        let activityController = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
        activityController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityController, animated: true)
    }
    
}
