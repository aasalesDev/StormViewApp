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
        
        if let imageToLoad = image {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
}
