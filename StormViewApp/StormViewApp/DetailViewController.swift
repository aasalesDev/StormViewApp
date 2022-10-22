//
//  DetailViewController.swift
//  Social Media App
//
//  Created by Anderson Sales on 22/10/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var image: String?
    var images = [String]()
    var position: Int?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(position ?? 0) of \(images.count)"
        navigationItem.largeTitleDisplayMode = .never
        
        //Creation of a navigation item
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = image {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped(){
        //It is needed to go to the file info.plist (right click -> add row) -> privacy - Photo Library Addition....
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
