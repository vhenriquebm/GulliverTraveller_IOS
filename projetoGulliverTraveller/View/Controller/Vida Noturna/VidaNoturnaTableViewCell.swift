//
//  VidaNoturnaTableViewCell.swift
//  projetoGulliverTraveller
//
//  Created by Vitor Henrique Barreiro Marinho on 29/04/22.
//

import UIKit


class VidaNoturnaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var localImagem: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateView()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func updateView () {
        
//        localImagem.layer.borderWidth = 1.0
//        localImagem.layer.masksToBounds = false
//        localImagem.layer.borderColor = UIColor.white.cgColor
//        localImagem.layer.cornerRadius = localImagem.frame.size.width/2
//        localImagem.clipsToBounds = true
        
        
    }
    
    
    
}
