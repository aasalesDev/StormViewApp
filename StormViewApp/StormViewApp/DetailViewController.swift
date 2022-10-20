//
//  DetailViewController.swift
//  StormViewApp
//
//  Created by Anderson Sales on 20/10/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var image: String?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = image
        navigationItem.largeTitleDisplayMode = .never
        
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
}
