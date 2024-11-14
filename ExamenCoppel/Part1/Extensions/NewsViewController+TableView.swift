//
//  NewsViewController+TableView.swift
//  ExamenCoppel
//
//  Created by Hugo Rivera on 11/11/24.
//

import Foundation
import UIKit

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        guard let news = self.news else { return UITableViewCell() }
        cell.setInfo(title: news[indexPath.row].title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let news = self.news else { return }
        presenter?.showDetails(news[indexPath.row])
    }
    
}
