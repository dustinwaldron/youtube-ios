//
//  MenuBar.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/3/20.
//

import UIKit

public class MenuBar: UIView {
    lazy var collectionView: UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        cv.dataSource = self
        cv.delegate = self
 
        return cv
    }()
        
    let imageNames = ["home", "trending", "account", "subscriptions"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(MenuBarItemCollectionViewCell.self, forCellWithReuseIdentifier: MenuBarItemCollectionViewCell.identifier)
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        let selecterdIdexPath = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selecterdIdexPath as IndexPath, animated: false, scrollPosition: .centeredHorizontally)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuBar: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuBarItemCollectionViewCell.identifier, for: indexPath) as? MenuBarItemCollectionViewCell {
            cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
            cell.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / CGFloat(imageNames.count), height: frame.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
