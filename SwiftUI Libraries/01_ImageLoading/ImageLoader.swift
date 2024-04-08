//
//  ImageLoader.swift
//  SwiftUI Libraries
//
//  Created by Vuk Knezevic on 04.04.24.
//

import SwiftUI

struct ImageLoader: View {
    
    let url: String
    var contentMode: ContentMode = .fit
    
    var body: some View {
        // MARK: - fora za slike, jer one mogu prelaziti zadati frame
        Rectangle()
            .opacity(0)
            .overlay {
//                SDWebImageLoader(url: url, contentMode: contentMode)
                KingfisherImage(url: url, contentMode: contentMode)
            }
            .clipped()
    }
}


#Preview {
    ImageLoader(
        url: "https://picsum.photos/id/237/200/300",
        contentMode: .fill
    )
}
