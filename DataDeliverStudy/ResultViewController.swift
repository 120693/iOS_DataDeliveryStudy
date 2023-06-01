//
//  ResultViewController.swift
//  DataDeliverStudy
//
//  Created by jhchoi on 2023/06/01.
//

import UIKit

class ResultViewController: UIViewController {

    var weatherInformation: WeatherModel?
    
    @IBOutlet weak var resultText: UILabel! {
        didSet {
            if let model = self.weatherInformation {
                resultText.text = model.name
            }
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
