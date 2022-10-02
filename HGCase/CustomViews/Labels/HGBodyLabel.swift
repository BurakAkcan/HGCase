//
//  HGBodyLabel.swift
//  HGCase
//
//  Created by Burak AKCAN on 2.09.2022.
//

import UIKit

class HGBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure() 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlign:NSTextAlignment,fontSize:CGFloat){
        self.init(frame: .zero)
        self.font = UIFont(name: "Titillium", size: fontSize)
        self.textAlignment = textAlign
    }
    
    private func configure(){
        textColor = UIColor(red: 0.3176, green: 0.3333, blue: 0.3608, alpha: 1.0)
        
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor        = 0.6
        lineBreakMode             = .byTruncatingTail
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    

}
