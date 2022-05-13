//
//  ViewController.swift
//  projetoGulliverTraveller
//
//  Created by Vitor Henrique Barreiro Marinho on 29/04/22.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    @IBOutlet weak var myPageControl: UIPageControl!
    
    @IBOutlet weak var colecao: UICollectionView!

    let trips = [
        Trip(imagem: "bebida300"),
        Trip(imagem: "image02"),
        Trip(imagem: "image03"),
        Trip(imagem: "image04"),
        Trip(imagem: "image05")
    ]
    
    var timer: Timer?
    
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        colecao.delegate = self
        colecao.dataSource = self
        starttIMER()
        myPageControl.currentPage = 0
        myPageControl.numberOfPages = trips.count
        
        let autenticacao = Auth.auth()
            
        autenticacao.addStateDidChangeListener { autenticacao, usuario in
            
            if let usuarioLogado = usuario {
                
                self.performSegue(withIdentifier: "logado", sender: nil)
                
                
            }
        }
        
        
       
    }


    
    
    
    
  
    func starttIMER () {
    
    
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)

    }
    
    
    @objc func moveToNextIndex () {
        
        if counter < trips.count - 1 { counter += 1}

        else {counter = 0}
        
        colecao.scrollToItem(at: IndexPath(item: counter, section: 0), at: .right, animated: true)

        
        myPageControl.currentPage = counter
        
    }
    
    

    
}


extension HomeViewController: UICollectionViewDelegate {

}



extension HomeViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return trips.count    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if let cell = colecao.dequeueReusableCell(withReuseIdentifier: "bannerCollectionCell", for: indexPath) as? BannerCollectionViewCell {
            
            cell.updatebannerImage(data: trips[indexPath.row])
            
            
            return cell
        }
        
        
        let cell = UICollectionViewCell ()
        
        return cell
        
    }
    
    
}



extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = collectionView.bounds.width
        let itemHeight = collectionView.bounds.height
        return CGSize(width: itemWidth, height: itemHeight)
    }

    
 
    

    
    
    
}


