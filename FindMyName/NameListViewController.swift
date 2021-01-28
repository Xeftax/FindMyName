//
//  ViewController.swift
//  FindMyName
//
//  Created by Quentin on 25/01/2021.
//

import UIKit

class NameListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let elements = [["Quentin","m","France","3","5"],["Clélia","f","Italie","0","2"]]
    
    @IBOutlet weak var nameList: UITableView!
    
    override func viewDidLoad() {
        nameList.delegate = self
        nameList.dataSource = self
        super.viewDidLoad()
        
        let cell = nameList.dequeueReusableCell(withIdentifier: "nameTableCell") as! NameTableCell
        nameList.frame.size.height = CGFloat(elements.count+1) * cell.frame.size.height
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = nameList.dequeueReusableCell(withIdentifier: "nameTableCell") as! NameTableCell
        
        cell.nameLabel.text = elements[indexPath.row][0]
        cell.genderLabel.text = elements[indexPath.row][1]
        cell.originLabel.text = elements[indexPath.row][2]
        cell.popularityLabel.text = elements[indexPath.row][3]
        cell.rateLabel.text = elements[indexPath.row][4]
        
        return cell
    }
    
    func openAddNameView(alert: UIAlertAction!) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addNameViewController = storyBoard.instantiateViewController(withIdentifier: "addNameView")
        self.present(addNameViewController, animated: true, completion: nil)
    }
    
    @IBAction func modifyButton(_ sender: Any) {
    }
    
    
    @IBAction func addNewButton(_ sender: Any) {
        let addMenu = UIAlertController(title: "Ajouter des prénoms", message: nil, preferredStyle: .actionSheet)
        
        let addManualy = UIAlertAction(title: "Manuellement", style: .default, handler: openAddNameView)
        let addFromCSV = UIAlertAction(title: "A partir d'un .csv", style: .default, handler: nil)
        let addCancel = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        
        addMenu.addAction(addManualy)
        addMenu.addAction(addFromCSV)
        addMenu.addAction(addCancel)
        
        self.present(addMenu,animated: true, completion: nil)
    }

}

