//
//  ViewController.swift
//  Basic2ScreenApp
//
//  Created by Soner Karaevli on 2.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var operatingSystemNames = [String]()
    var operatingSystemImageNames = [String]()
    
    var selectedName = ""
    var selectedImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        operatingSystemNames.append("Android")
        operatingSystemNames.append("iOS")
        operatingSystemNames.append("Tizen")
        operatingSystemNames.append("HarmonyOS")
        operatingSystemNames.append("Windows")
        
        
        operatingSystemImageNames.append("android")
        operatingSystemImageNames.append("ios")
        operatingSystemImageNames.append("tizen")
        operatingSystemImageNames.append("harmonyOS")
        operatingSystemImageNames.append("windows")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operatingSystemNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = operatingSystemNames[indexPath.row]
        return cell

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            operatingSystemNames.remove(at: indexPath.row)
            operatingSystemImageNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedName = operatingSystemNames[indexPath.row]
        selectedImageName = operatingSystemImageNames[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    // DetailsViewController classındaki değişkenlere böyle erişiyoruz
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedOSName = selectedName
            destinationVC.selectedOSImageName = selectedImageName
        }
    }


}

