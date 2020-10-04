//
//  HomeViewModel.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/3/20.
//

public class HomeViewModel {
    let videoService = VideoService()
    
    public var videos: [Video] = []
    
    public func setup() {
        videos = videoService.fetchVideos()
    }
    
    public func filterVideos(by searchTerm: String) {
        self.videos = videoService.fetchVideos().filter { return $0.artist.name.contains(searchTerm) || $0.title.contains(searchTerm) }
    }
}
