//
//  HGTitleLabel.swift
//  HGCase
//
//  Created by Burak AKCAN on 2.09.2022.
//

import UIKit

class HGTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlign:NSTextAlignment,fontSize:CGFloat){
        self.init(frame: .zero)
        self.textAlignment = textAlign
        self.font = UIFont(name: "Titillium", size: fontSize)
        
        
        
    }
    
    private func configure(){
        
        
        adjustsFontSizeToFitWidth                 = true
        minimumScaleFactor                        = 0.6
        lineBreakMode                             = .byCharWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
