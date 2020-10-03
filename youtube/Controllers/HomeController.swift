//
//  HomeController.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/3/20.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var videoCollection: UICollectionView!
    
    let videos = [
        Video(title: "Life is Good feat. Future",
              thumbnailImage: "Drake - Life Is Good",
              artist: Artist(name: "Drake",
                             avatarImage: "drake"),
              totalLikes: 5000,
              createDate: "2020-02-21T19:32:00Z"),
        Video(title: "Stir Fry",
              thumbnailImage: "Migos - Stir Fry",
              artist: Artist(name: "Migos",
                             avatarImage: "migos"),
              totalLikes: 30328,
              createDate: "2017-07-21T19:32:00Z"),
        Video(title: "Homecoming",
              thumbnailImage: "Kanye - Homecoming",
              artist: Artist(name: "Kanye",
                             avatarImage: "kanye"),
              totalLikes: 498828,
              createDate: "2013-02-13T19:32:00Z"),
        Video(title: "Shake It Off",
              thumbnailImage: "Taylor Swift - Shake It Off",
              artist: Artist(name: "Taylor Swift",
                             avatarImage: "taylor-swift"),
              totalLikes: 2000000,
              createDate: "2014-03-13T19:32:00Z"),
        Video(title: "Thrift Shop feat. Ryan Lewis",
              thumbnailImage: "Macklemore - Thrift Shop",
              artist: Artist(name: "Macklemore",
                             avatarImage: "macklemore"),
              totalLikes: 615983,
              createDate: "2013-06-01T19:32:00Z")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
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
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = videoCollection.dequeueReusableCell(withReuseIdentifier: VideoCell.identifier(), for: indexPath) as? VideoCell {
            let video = videos[indexPath.row]
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
            let video = videos[indexPath.row]
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
