//
//  VideoCell.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/3/20.
//

import UIKit

public class VideoCell: UICollectionViewCell {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var videoThumbnailImage: UIImageView!
    @IBOutlet weak var avatarThumbnailImage: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoSubtitleLabel: UILabel!
    
    public static func identifier() -> String {
        return String(describing: self) + "Identifier"
    }
    
    public func setup(for collectionView: UICollectionView, video: Video) {
        let artist = video.artist
        videoThumbnailImage.image = UIImage(named: video.thumbnailImage)?.imageRefit(collectionView.frame.width)
        avatarThumbnailImage.image = UIImage(named: artist.avatarImage)
        avatarThumbnailImage.roundCorners()
        videoTitleLabel.text = video.title
        let timeAgo = (video.createDate.toDate() ?? Date()).timeAgo()
        videoSubtitleLabel.text = "\(artist.name) • \(video.totalLikes.withCommas) likes • \(timeAgo)"
        videoTitleLabel.sizeToFit()
        videoSubtitleLabel.sizeToFit()
    }
    
    static func register(for collectionView: UICollectionView)  {
        let cellNib = UINib(nibName: String(describing: self), bundle: nil)
        collectionView.register(cellNib.self, forCellWithReuseIdentifier: identifier())
    }
}
