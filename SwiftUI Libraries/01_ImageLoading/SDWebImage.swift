//
//  01_SDWebImage.swift
//  SwiftUI Libraries
//
//  Created by Vuk Knezevic on 03.04.24.
//

import SwiftUI
import SDWebImageSwiftUI

// MARK: - Decoupling - koristicemo sdk samo na ovom mestu, i ako se desi da treba da ga promenimo, ne menjamo import po citavom projektu vec samo na ovom mestu
struct SDWebImageLoader: View {
    
    let url: String
    var contentMode: ContentMode = .fit
    
    var body: some View {
        WebImage(url: URL(string: url)) { image in
            image
        } placeholder: {
            Color.gray
                .opacity(0.3)
                .overlay {
                    ProgressView()
                }
            
        }
        .onSuccess(perform: { image, data, cache in
            print(image)
            print(data ?? "")
            print(cache)
            print("*******")
        })
        .onFailure(perform: { error in
            print(error)
            print("*******")
        })
        .resizable()
//        .indicator(.activity)
        .aspectRatio(contentMode: .fit)

    }
}

struct SDWebImageBootcamp: View {
    var body: some View {
        ImageLoader(
            url: "https://picsum.photos/id/237/200/300",
            contentMode: .fill
        )
        .frame(width: 200, height: 200)
    }
}

#Preview {
    SDWebImageBootcamp()
}
