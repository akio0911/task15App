//
//  ItemCell.swift
//  task14App
//
//  Created by yasudamasato on 2021/05/20.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var checkImageView: UIImageView!

    func configure(name: String, isChecked: Bool) {
        self.nameLabel.text = name
        self.checkImageView.image = isChecked ? UIImage(named: "check") : nil
    }

}
