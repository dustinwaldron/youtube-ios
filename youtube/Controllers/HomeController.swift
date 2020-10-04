//
//  HomeController.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/3/20.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var videoCollection: UICollectionView!
    
    let menuBar = MenuBar()
    let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setup()
        setupNavigationBar()
        setupCollectionView()
        setupMenuBar()
        setupNavBarItems()
    }
    
    public static func fromStoryboard() -> HomeController? {
        return UIStoryboard(name: "Home", bundle: nil)
            .instantiateViewController(withIdentifier: "Home") as? HomeController
    }
    
    func setupCollectionView() {
        videoCollection.delegate = self
        videoCollection.dataSource = self
        VideoCell.register(for: videoCollection)
    }
    
    func setupNavBarItems() {
        let moreButton = UIBarButtonItem.menuButton(self, action: #selector(handleMoreTapped), imageName: "nav_more_icon", size: 28, tintColor: UIColor.white)
        let searchButton = UIBarButtonItem.menuButton(self, action: #selector(handleSearchTapped), imageName: "search_icon", size: 28, tintColor: UIColor.white)
        
        navigationItem.rightBarButtonItems = [moreButton, searchButton]
    }
    
    @objc func handleSearchTapped() {
        
    }
    
    @objc func handleMoreTapped() {
        
    }
    
    func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(50)]", views: menuBar)
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.isTranslucent = false
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.textColor = UIColor.white
        titleLabel.text = "Home"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        self.navigationItem.titleView = titleLabel
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = videoCollection.dequeueReusableCell(withReuseIdentifier: VideoCell.identifier(), for: indexPath) as? VideoCell {
            let video = viewModel.videos[indexPath.row]
            cell.setup(for: videoCollection, video: video)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    private func size(for indexPath: IndexPath) -> CGSize {
        let width = videoCollection.frame.width
        let height: CGFloat = 0

        let targetSize = CGSize(width: width, height: height)
        if let cell = videoCollection.dequeueReusableCell(withReuseIdentifier: VideoCell.identifier(), for: indexPath) as? VideoCell {
            let video = viewModel.videos[indexPath.row]
            cell.setup(for: videoCollection, video: video)
            let size = cell.contentView.systemLayoutSizeFitting(targetSize,
                                                                withHorizontalFittingPriority: .defaultHigh,
                                                                verticalFittingPriority: .fittingSizeLevel)

            return size
        }
        
        return targetSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return size(for: indexPath)
    }
}
