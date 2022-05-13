//
//  VidaNoturnaViewController.swift
//  projetoGulliverTraveller
//
//  Created by Vitor Henrique Barreiro Marinho on 29/04/22.
//


import UIKit

class VidaNoturnaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    
    
    @IBOutlet weak var table: UITableView!
    
    


}


extension VidaNoturnaViewController: UITableViewDelegate {
    
}


extension VidaNoturnaViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = table.dequeueReusableCell(withIdentifier: "VidaNoturna", for: indexPath) as? VidaNoturnaTableViewCell {
            
            return cell
        }
     
        
        let cell = UITableViewCell()
        
        return cell
        
    }
    
    
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    
    
}


