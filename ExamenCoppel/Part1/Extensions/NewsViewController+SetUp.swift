//
//  NewsViewController+SetUp.swift
//  ExamenCoppel
//
//  Created by Hugo Rivera on 11/11/24.
//

import Foundation
import UIKit

extension NewsViewController {
    
    func setUp() {
        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(close))
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "NewsCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableView.automaticDimension
        self.refreshControl.attributedTitle = NSAttributedString(string: "Cargando...")
        self.refreshControl.addTarget(self, action: #selector(reloadData), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
    }
    
}
