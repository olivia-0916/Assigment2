//
//  ViewController.swift
//  Assigment2
//
//  Created by CHI on 2021/4/14.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var airports: [Airport] = []
    
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        tableview.delegate = self
        tableview.dataSource = self
        title = "Airport List"
        // start here...
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airports.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "AirportCell", for:indexPath) as? AirportCell
        
        let airport = airports[indexPath.row]
        cell?.airportimage.image = UIImage(named: (airport.imageName))
        cell?.namelabel.text = airport.name
        cell?.countrylabel.text = airport.country
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let airport = airports[indexPath.row]
        performSegue(withIdentifier: "gotodetailpage", sender: airport)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //print(sender as? String)
        switch segue.identifier {
        case "gotodetailpage":
            let airport = sender as? Airport
            if let DetailPage = segue.destination as? Detailpage{
                DetailPage.airport = airport
            }
        default:
            break
        }
    
    }
}
    extension ViewController {
    private func fetchData() {
        guard let path = Bundle.main.path(forResource: "airports", ofType: "plist"),
              let xml = FileManager.default.contents(atPath: path),
              let airports = try? PropertyListDecoder().decode([Airport].self, from: xml) else {
            return
        }
        self.airports = airports
        tableview.reloadData()
    }
}
