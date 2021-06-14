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

    func configure(item: ChecklistItem) {
        nameLabel.text = item.name
        checkImageView.image = item.isChecked ? UIImage(named: "check") : nil
    }
}
