//
//  PriceLabel.swift
//  HGCase
//
//  Created by Burak AKCAN on 3.09.2022.
//

import UIKit

class PriceLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        textColor                 = Colors.loginButtonColors
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor        = 0.9
        lineBreakMode             = .byCharWrapping
        font                      = UIFont(name: "Lato", size: 18)
        font                      = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
