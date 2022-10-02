//
//  HGTextField.swift
//  HGCase
//
//  Created by Burak AKCAN on 2.09.2022.
//

import UIKit

class HGTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeHolder:String,textAlign:NSTextAlignment,radius:CGFloat){
        self.init(frame: .zero)
        layer.cornerRadius  = radius
        self.placeholder    = placeHolder
        textAlignment       = textAlign
        
    }
    
    private func configure(){
        
        textColor           = .label
        tintColor           = .label
        font                = UIFont.systemFont(ofSize: 16)
        returnKeyType       = .go
        minimumFontSize     = 12
        backgroundColor     = .white
        autocorrectionType  = .no
        layer.shadowColor   = UIColor.systemGray4.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius  = 8
        layer.shadowOffset  = CGSize(width: 0, height: 10)
    }
    
    
}
