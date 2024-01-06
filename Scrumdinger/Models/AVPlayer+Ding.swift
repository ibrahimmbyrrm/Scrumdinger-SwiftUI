//
//  AVPlayer+Ding.swift
//  Scrumdinger
//
//  Created by İbrahim Bayram on 5.01.2024.
//

import AVFoundation

extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else { fatalError("Failed to find sound file.") }
        return AVPlayer(url: url)
    }()
}
