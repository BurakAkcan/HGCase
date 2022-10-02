//
//  HGButton.swift
//  HGCase
//
//  Created by Burak AKCAN on 2.09.2022.
//

import UIKit

class HGButton: UIButton {
  
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor:UIColor,title:String,radius:CGFloat){
        self.init(frame: .zero)
        self.backgroundColor    = backgroundColor
        self.layer.cornerRadius = radius
        self.setTitle(title, for: .normal)
        
    }
    private func configure(){
        layer.cornerRadius = 50
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
