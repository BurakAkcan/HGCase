//
//  ProductCell.swift
//  HGCase
//
//  Created by Burak AKCAN on 3.09.2022.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    static let reuseID = "productCell"
    
    //MARK: - Views
    
    let nameLabel        = HGTitleLabel(textAlign: .natural, fontSize: 16)
    let productImageView = ProductImageView(frame: .zero)
    let priceLabel       = PriceLabel()
    
   
    
    //MARK: - Properties
    
    let padding:CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(productImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(product:Product){
        nameLabel.text          = product.title
        nameLabel.numberOfLines = 2
        priceLabel.text         = "\(product.price) TL"
        
        NetworkManager.shared.downloadImage(from: product.image) { [weak self] (image) in
            DispatchQueue.main.async {
                self?.productImageView.image       = image
                self?.productImageView.contentMode = .scaleToFill
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        productImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height*0.58)
        nameLabel.frame = CGRect(x: 0, y: contentView.frame.size.height*0.62, width: contentView.frame.size.width*0.715, height: contentView.frame.size.height*0.22 )
        priceLabel.frame = CGRect(x: 0, y: contentView.frame.size.height*0.89, width: contentView.frame.size.width*0.45, height: contentView.frame.size.height*0.11)
    }
}
    

    
    

