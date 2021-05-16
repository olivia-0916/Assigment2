//
//  Detailpage.swift
//  Assigment2
//
//  Created by 麥可不可 on 2021/5/10.
//

import UIKit

class Detailpage: UIViewController {

    @IBOutlet weak var photoimage: UIImageView!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var shortname: UILabel!
    @IBOutlet weak var locationlabel: UILabel!
    @IBOutlet weak var itatlabel: UILabel!
    
    var airport: Airport?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoimage.image = UIImage(named: (airport?.imageName)!)
        namelabel.text = airport?.name
        locationlabel.text = airport?.servedCity
        itatlabel.text = airport?.IATA
        shortname.text = airport?.shortName
        navigationItem.title = airport?.IATA
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
