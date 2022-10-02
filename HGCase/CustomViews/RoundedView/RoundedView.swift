//
//  RoundedView.swift
//  HGCase
//
//  Created by Burak AKCAN on 3.09.2022.
//

import UIKit

class RoundedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(color:UIColor){
        super.init(frame: .zero)
        self.layer.backgroundColor = color.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(){
        self.init(frame: .zero)
       layer.shadowRadius   = 20
        layer.shadowOffset  = CGSize(width: 0, height: 10)
        layer.shadowColor   = UIColor.systemGray4.cgColor
        layer.shadowOpacity = 0.5
       layer.cornerRadius   = 20
       translatesAutoresizingMaskIntoConstraints = false
    }
}
