//
//  DetailsViewController.swift
//  Basic2ScreenApp
//
//  Created by Soner Karaevli on 2.04.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedOSImageName: String = ""
    var selectedOSName: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: selectedOSImageName)
        lblText.text = selectedOSName

    }
    



}
