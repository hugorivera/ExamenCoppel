//
//  NewsTableViewCell.swift
//  ExamenCoppel
//
//  Created by Hugo Rivera on 11/11/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleCell: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.titleCell.text = ""
    }
    
    func setInfo(title: String) {
        self.titleCell.text = title
    }
    
}
