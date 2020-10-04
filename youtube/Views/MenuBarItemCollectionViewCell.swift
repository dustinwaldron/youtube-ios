//
//  MenuBarItemCollectionViewCell.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/3/20.
//

import UIKit

public class MenuBarItemCollectionViewCell: BaseCell {
    static public let identifier = "MenuBarItemCollectionViewCellIdentifier"
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "")
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    public override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        setupView()
    }
    
    func setupView() {
        addSubview(imageView)
        imageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor.self, constant: 0).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor.self, constant: 0).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
