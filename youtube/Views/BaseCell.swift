//
//  BaseCell.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/3/20.
//

import UIKit

public class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
