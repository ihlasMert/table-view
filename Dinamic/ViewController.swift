//
//  ViewController.swift
//  Dinamic
//
//  Created by ihlas on 30.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    let sections = ["Animals", "Fruits", "Cars"]
    let rows: [[String]] = [
        ["Camel", "Horse", "Lion"],
        ["Apple", "Banane", "Candy"],
        ["Audio", "BMV", "OPEL"],

    ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int { //sıra sayıları.
        sections.count //seçtiğin kadar sıra
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //sıradaki sayılar
        rows[section].count //seçildği kadar sıra vardır.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MytableViewCell") as! MytableViewCell //hücredeki sıralar
        
        let title = rows[indexPath.section][indexPath.row]
        cell.cellLabel.text = title
        cell.cellİmageView.image = #imageLiteral(resourceName: "a.jpeg")
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { //seçilen başlık
        return sections[section]
    }
    
}
extension ViewController: UITableViewDelegate{ //
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //seçilmiş satır
        print("You Selected: \(rows[indexPath.section][indexPath.row])" )
    }
}


class MytableViewCell: UITableViewCell{
    @IBOutlet var cellİmageView: UIImageView!
    
    @IBOutlet var cellLabel: UILabel!
}
