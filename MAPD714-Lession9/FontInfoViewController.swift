//
//  FontInfoViewController.swift
//  MAPD714-Lession9
//
//  Created by Shubh Patel on 2018-11-17.
//  Copyright © 2018 Shubh Patel. All rights reserved.
//

import UIKit

class FontInfoViewController: UIViewController {
    
    var font: UIFont!
    var favorite: Bool = false
    @IBOutlet weak var fontSampleLabel: UILabel!
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontSampleLabel.font = font
        
        fontSampleLabel.text = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz 0123456789"
        
        fontSizeSlider.value = Float(font.pointSize/100)
        
        fontSizeLabel.text = "\(Int(font.pointSize))"
        
        favoriteSwitch.isOn = favorite

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func slideFontSize(_ slider: UISlider) {
        
        let newSize = roundf(slider.value * 100)
        fontSampleLabel.font = font.withSize(CGFloat(newSize))
         fontSizeLabel.text = "\(Int(newSize))"
        
    }
    
    
    @IBAction func toggleFavorite(_ sender: UISwitch) {
        
        let favoritesList = FavoritesList.sharedFavoritesList
        
        if(sender.isOn){
            favoritesList.addFavorite(fontName: font.fontName)
        } else {
            favoritesList.removeFavorite(fontName: font.fontName)
        }
    }
    
    
    // MARK: - Navigation

   
 

}
