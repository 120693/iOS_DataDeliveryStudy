//
//  ViewController.swift
//  DataDeliverStudy
//
//  Created by jhchoi on 2023/06/01.
//

import UIKit

class ViewController: UIViewController{
    
    let resultViewController = ResultViewController()
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapButton(_ sender: UIButton) {
        if let cityName = self.cityNameTextField.text {
            self.getWeather(cityName: cityName) { model in
                self.resultViewController.weatherInformation = model
                self.navigationController?.pushViewController(self.resultViewController, animated: false)
            }
        }
        
    }
    
    func getWeather(cityName: String, cb: @escaping (_ vc: WeatherModel) -> Void) {
       
        let apiKey = "a8c1d55d8c112dbe5f0576f243f507ac"
        
        var components = URLComponents()
        
        let scheme = "https"
        let host = "api.openweathermap.org"
        
        components.scheme = scheme
        components.host = host
        components.path = "/data/2.5/weather"
        components.queryItems = [URLQueryItem(name: "q", value: cityName), URLQueryItem(name: "appid", value: apiKey)]
        
        let url = components.url!
        debugPrint(url)
        
        var request = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            guard let weatherModel = try? decoder.decode(WeatherModel.self, from: data) else { return }
            // debugPrint(weatherModel)
            self.resultViewController.weatherInformation = weatherModel
            
            DispatchQueue.main.async {
                //            self.present(resultViewController, animated: false)
                            cb(weatherModel)
            }

            debugPrint(self.resultViewController.weatherInformation)
        }.resume()
    }
}

