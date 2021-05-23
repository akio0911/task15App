//
//  AddViewController.swift
//  task14App
//
//  Created by yasudamasato on 2021/05/21.
//

import UIKit

class AddViewController: UIViewController {

    private(set) var name: String?

    @IBOutlet weak var addTextField: UITextField!
    
    @IBAction func didTapSave(_ sender: Any) {
        name = addTextField.text
        performSegue(withIdentifier: "SaveSegue", sender: sender)
    }
}
