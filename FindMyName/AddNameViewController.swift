//
//  AddNameViewController.swift
//  FindMyName
//
//  Created by Quentin on 27/01/2021.
//

import UIKit

class AddNameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var infoList: UITableView!
    
    var tableViewSize: CGFloat = 0
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = infoList.dequeueReusableCell(withIdentifier: "genderCell") as! GenderCell
            tableViewSize += cell.frame.size.height
            return cell
            
        } else if indexPath.row == 1 {
            let cell = infoList.dequeueReusableCell(withIdentifier: "popularityCell") as! PopularityCell
            tableViewSize += cell.frame.size.height
            return cell
        } else if indexPath.row == 3 {
            let cell = infoList.dequeueReusableCell(withIdentifier: "addOriginCell") as! AddOriginCell
            tableViewSize += cell.frame.size.height
            return cell
        } else {
            let cell = infoList.dequeueReusableCell(withIdentifier: "originCell") as! OriginCell
            tableViewSize += cell.frame.size.height
            return cell
        }
            
    }
    
    override func viewDidLoad() {
        infoList.delegate = self
        infoList.dataSource = self
        super.viewDidLoad()
                
        infoList.frame.size.height = tableViewSize

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
