//
//  BannerCollectionViewCell.swift
//  projetoGulliverTraveller
//
//  Created by Vitor Henrique Barreiro Marinho on 29/04/22.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionImage: UIImageView!
    
   
    
    override func awakeFromNib() {
        
        
        updateColletionView()
    }
    
    
    
    
    func updateColletionView () {
        
//           collectionImage?.layer.cornerRadius = (collectionImage?.frame.size.width ?? 0.0) / 2
//           collectionImage?.clipsToBounds = true
//           collectionImage?.layer.borderWidth = 3.0
//           collectionImage?.layer.borderColor = UIColor.white.cgColor
       }
        
  
    
    func updatebannerImage (data: Trip) {
        
        collectionImage.image = UIImage(named: data.imagem)

    }
    
    
    
    
    
    
}
