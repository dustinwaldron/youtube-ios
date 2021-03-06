//
//  Video.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/3/20.
//

import Foundation

public class Artist: Codable {
    public let name: String
    public let avatarImage: String
    
    init(name: String, avatarImage: String) {
        self.name = name
        self.avatarImage = avatarImage
    }
}

public class Video: Codable {
    public let title: String
    public let thumbnailImage: String
    public let artist: Artist
    public let totalViews: Int
    public let totalLikes: Int
    public let createDate: String
    
    init(title: String, thumbnailImage: String, artist: Artist, totalLikes: Int, totalViews: Int, createDate: String) {
        self.title = title
        self.thumbnailImage = thumbnailImage
        self.artist = artist
        self.totalLikes = totalLikes
        self.totalViews = totalViews
        self.createDate = createDate
    }
}
