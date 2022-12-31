//
//  ViewController.swift
//  ProjectChallenge1
//
//  Created by Luiz R on 31/12/22.
//

import UIKit

class ViewController: UITableViewController {
    
    @IBOutlet var selectedImage: UIImageView!
    var flagPictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasSuffix("png") {
                flagPictures.append(item)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flagPictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagPicture", for: indexPath)
        cell.textLabel?.text = flagPictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                
            detailViewController.selectedImage =  flagPictures[indexPath.row]
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }


}

