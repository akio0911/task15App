//
//  TableViewController.swift
//  task14App
//
//  Created by yasudamasato on 2021/05/20.
//

import UIKit

class TableViewController: UITableViewController {

    let KeyName = "Name"
    let KeyCheck = "Check"

    var checklistItems: [Dictionary<String,Any>] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.checklistItems = [
            [KeyName:"りんご", KeyCheck:false],
            [KeyName:"みかん", KeyCheck:true],
            [KeyName:"バナナ", KeyCheck:false],
            [KeyName:"パイナップル", KeyCheck:true],
        ]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checklistItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell

        cell.configure(
            name: checklistItems[indexPath.row][KeyName] as! String,
            isChecked: checklistItems[indexPath.row][KeyCheck] as! Bool == true
        )

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell = checklistItems[indexPath.row][KeyCheck] as! Bool

        checklistItems[indexPath.row][KeyCheck] = !cell

        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    @IBAction func exitCancel(segue: UIStoryboardSegue) {
    }

    @IBAction func exitSave(segue: UIStoryboardSegue) {

        if let add = segue.source as? AddViewController {
            let name: Dictionary<String,Any> = [KeyName: add.name!, KeyCheck: false]
            self.checklistItems.append(name)
            tableView.reloadData()
        }
    }

}
