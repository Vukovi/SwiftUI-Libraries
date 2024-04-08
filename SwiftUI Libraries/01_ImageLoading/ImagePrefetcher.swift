//
//  ImagePrefetcher.swift
//  SwiftUI Libraries
//
//  Created by Vuk Knezevic on 04.04.24.
//

import SwiftUI
import SDWebImageSwiftUI
import Kingfisher

final class ImagePrefetcher {
    
    static let shared = ImagePrefetcher()
    
    private let prefetcher = SDWebImagePrefetcher()
    private var prefetcherKingfishers: [[URL]:Kingfisher.ImagePrefetcher] = [:]
    
    private init() {}
    
    func startPrefetching(urls: [URL]) {
        prefetcher.prefetchURLs(urls)
    }
    
    func startKingfisherPrefetching(urls: [URL]) {
        prefetcherKingfishers = [urls:Kingfisher.ImagePrefetcher(urls: urls)]
        prefetcherKingfishers[urls]?.start()
    }
    
    func stopPrefetching() {
        prefetcher.cancelPrefetching()
    }
    
    func stopKingfisherPrefetching(urls: [URL]) {
        prefetcherKingfishers[urls]?.stop()
    }
    
}
