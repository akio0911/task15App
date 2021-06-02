//
//  TableViewController.swift
//  task14App
//
//  Created by yasudamasato on 2021/05/20.
//

import UIKit

class TableViewController: UITableViewController {

    private var checklistItems = ["りんご", "みかん", "バナナ", "パイナップル"]

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checklistItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell

        cell.configure(
            name: checklistItems[indexPath.row],
            isChecked: indexPath.row % 2 == 1
        )

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell = tableView.cellForRow(at: indexPath) as! ItemCell

        if cell.checkImageView.image == nil {
            cell.checkImageView.image = UIImage(named: "check")
        }else {
            cell.checkImageView.image = nil
        }

    }

    @IBAction func exitCancel(segue: UIStoryboardSegue) {
    }

    @IBAction func exitSave(segue: UIStoryboardSegue) {

        guard let add = segue.source as? AddViewController,
              let name = add.name else { return }
        
        self.checklistItems.append(name)
        tableView.reloadData()
    }

}
