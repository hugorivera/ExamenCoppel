//
//  DetailViewController.swift
//  ExamenCoppel
//
//  Created Hugo Rivera on 12/11/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController, DetailViewProtocol {
    
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsBody: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsSource: UILabel!
    
    
	var presenter: DetailPresenterProtocol?
    var data: Datum?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        title = "Detalle"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        guard let data else { return }
        newsTitle.text = data.title
        newsBody.text = data.description
        newsSource.text = data.source
        newsImage.sd_setImage(with: URL(string: data.imageURL))
    }
}
