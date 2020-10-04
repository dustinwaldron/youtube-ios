//
//  VideoService.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/3/20.
//

import Foundation

public class VideoService {
    func fetchVideos() -> [Video] {
       return Bundle.main.decode([Video].self, from: "videos.json")
    }
}
