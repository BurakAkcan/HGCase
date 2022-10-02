//
//  ProductImageView.swift
//  HGCase
//
//  Created by Burak AKCAN on 3.09.2022.
//

import UIKit

class ProductImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layer.cornerRadius = 10
        clipsToBounds      = true
        contentMode        = .scaleAspectFit
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
