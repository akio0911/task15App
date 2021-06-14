//
//  TableViewController.swift
//  task14App
//
//  Created by yasudamasato on 2021/05/20.
//

import UIKit

struct ChecklistItem {
    var name: String
    var isChecked: Bool
}

class TableViewController: UITableViewController {

    private var checklistItems: [ChecklistItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        checklistItems = [
            ChecklistItem(name: "りんご", isChecked: false),
            ChecklistItem(name: "みかん", isChecked: true),
            ChecklistItem(name: "バナナ", isChecked: false),
            ChecklistItem(name: "パイナップル", isChecked: true),
        ]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checklistItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell

        cell.configure(item: checklistItems[indexPath.row])

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        checklistItems[indexPath.row].isChecked.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    @IBAction func exitCancel(segue: UIStoryboardSegue) {
    }

    @IBAction func exitSave(segue: UIStoryboardSegue) {

        if let add = segue.source as? AddViewController {
            checklistItems.append(ChecklistItem(name: add.name ?? "", isChecked: false))
            tableView.reloadData()
        }
    }

}
