//
//  KingfisherImage.swift
//  SwiftUI Libraries
//
//  Created by Vuk Knezevic on 04.04.24.
//

import SwiftUI
import Kingfisher

struct KingfisherImage: View {
    
    let url: String
    var contentMode: SwiftUI.ContentMode = .fit
    
    var body: some View {
        KFImage(URL(string: url))
            .placeholder { progress in
                Color.red
            }
            .resizable()
            .onProgress({ receivedSize, totalSize in
                //
            })
            .onSuccess({ result in
                //
            })
            .onFailure({ error in
                //
            })
        // MARK: - procesor npr posle downloada cropuje sliku na 200X200, sto znaci dodatno vreme za prikaz slike
//            .setProcessor(<#T##processor: ImageProcessor##ImageProcessor#>)
            .aspectRatio(contentMode: contentMode)
        
        /*
         KFImage.url(url)
                   .placeholder(placeholderImage)
                   .setProcessor(processor)
                   .loadDiskFileSynchronously()
                   .cacheMemoryOnly()
                   .fade(duration: 0.25)
                   .lowDataModeSource(.network(lowResolutionURL))
                   .onProgress { receivedSize, totalSize in  }
                   .onSuccess { result in  }
                   .onFailure { error in }
         */
    }
}

#Preview {
    KingfisherImage(
        url: "https://picsum.photos/id/237/200/300",
        contentMode: .fit
    )
    .frame(width: 200, height: 200)
}
