//
//  TableViewCell.swift
//  HGCase
//
//  Created by Burak AKCAN on 5.09.2022.
//

import UIKit

class PageSheetCell: UITableViewCell {
    static let reuseId = "sheetCell"
    
    let nameLabel      = HGBodyLabel(textAlign: .natural, fontSize: 16)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(from name:String){
        nameLabel.text = name
        print(name)
    }
    
    private func configure(){
        addSubview(nameLabel)
        nameLabel.numberOfLines = 0
        nameLabel.font          = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let marginGuide = contentView.layoutMarginsGuide
        
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 20),
          
        ])
    }
}
