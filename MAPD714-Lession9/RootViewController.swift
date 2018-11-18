//
//  RootViewController.swift
//  MAPD714-Lession9
//
//  Created by Shubh Patel on 2018-11-15.
//  Copyright © 2018 Shubh Patel. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    
    private var familyNames: [String]!
    private var cellPointSize: CGFloat!
    private var favouritesList: FavoritesList!
    private static let familyCell = "FamilyName"
    private static let favouritesCell = "Favourites"

    override func viewDidLoad() {
        super.viewDidLoad()

        familyNames = (UIFont.familyNames as [String]).sorted()
        
        let preferredTableViewFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        cellPointSize = preferredTableViewFont.pointSize
        favouritesList = FavoritesList.sharedFavoritesList
        tableView.estimatedRowHeight = cellPointSize
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
   

    func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont? {
        if indexPath.section == 0 {
            let familyName = familyNames[indexPath.row]
            let fontName = UIFont.fontNames(forFamilyName: familyName).first
            return fontName != nil ? UIFont(name: fontName!, size: cellPointSize) : nil
        } else {
            return nil
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return favouritesList.favorites.isEmpty ? 1 : 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 0 ? familyNames.count : 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "All Font Families" : "My Favourite Fonts"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RootViewController.familyCell, for: indexPath)
            cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath as NSIndexPath)
            cell.textLabel?.text = familyNames[indexPath.row]
            cell.detailTextLabel?.text = familyNames[indexPath.row]
            return cell
        } else {
            return tableView.dequeueReusableCell(withIdentifier: RootViewController.favouritesCell, for: indexPath)
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController]
        // Pass the selected obiect to the new view controller
        let indexPath  = tableView.indexPath(for: sender as! UITableViewCell)!
        let listVC = segue.destination as! FontListViewController
        
        print(indexPath.section)
       
        if indexPath.section == 0 {
        // Font names list
            let familyName = familyNames[indexPath.row]
            listVC.fontNames = (UIFont.fontNames(forFamilyName: familyName) as [String]).sorted()
      //      print(familyName.count);
            listVC.navigationItem.title  = familyName
            listVC.showFavourites =  false
            print("Nor")
    } else {
    // Favorites list
            print("Fav")
    listVC.fontNames = favouritesList.favorites
    listVC.navigationItem.title = "Favorites"
    listVC.showFavourites = true
        }
    }


   

}
