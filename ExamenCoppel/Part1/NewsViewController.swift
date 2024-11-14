//
//  NewsViewController.swift
//  ExamenCoppel
//
//  Created Hugo Rivera on 11/11/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class NewsViewController: UIViewController {
	var presenter: NewsPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl = UIRefreshControl()
    var news: [Datum]?

	override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshControl.beginRefreshing()
        presenter?.getNews()
    }
    
    @objc func reloadData() {
        presenter?.getNews()
    }
    
    @objc func close() {
        presenter?.goBack()
    }
    
}

extension NewsViewController: NewsViewProtocol {
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Aceptar", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        refreshControl.endRefreshing()
    }
    
    func setNews(_ news: [Datum]) {
        self.news = news
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
}
