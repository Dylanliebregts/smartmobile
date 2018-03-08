//
//  ViewController.swift
//  LandenLijst
//
//  Created by Fhict on 04/03/2018.
//  Copyright © 2018 Fhict. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var countryTableView: UITableView!
    var fetchedCountry = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryTableView.dataSource = self
        
        parseData()
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedCountry.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countryTableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = fetchedCountry[indexPath.row].country
        cell?.detailTextLabel?.text = fetchedCountry[indexPath.row].capital
        
        return cell!
    }
    
    

    func parseData()
    {
        
        fetchedCountry = []
        
        let url = "https://restcountries.eu/rest/v1/all"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        let configuration  = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
        
            if(error != nil){
                print("Error")
            }
            else{
                do{
                    
                    let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                    
                    for eachFetchedCountry in fetchedData{
                        let eachCountry = eachFetchedCountry as! [String: Any]
                        let country = eachCountry["name"] as! String
                        let capital = eachCountry["capital"] as! String
                        
                        self.fetchedCountry.append(Country(country: country, capital: capital))
                    }
                    
                   self.countryTableView.reloadData()
                    
                }
                catch{
                    print("Error 2")
                }
            }
        
        
    }

        task.resume()

}

}

class Country{
    
    var country : String
    var capital : String
    
    init(country : String, capital : String) {
        self.country = country
        self.capital = capital
    }
}
























