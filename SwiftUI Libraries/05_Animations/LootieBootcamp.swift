//
//  LootieBootcamp.swift
//  SwiftUI Libraries
//
//  Created by Vuk Knezevic on 05.04.24.
//

import SwiftUI
import Lottie

struct LootieBootcamp: View {
    
    var fileName: String = "Starnimation.json"
    var contentMode: UIView.ContentMode = .scaleAspectFit
    var lottieContentMode: LottieLoopMode = .playOnce
    var onAnimationDidFinish: (() -> Void)? = nil
    
    var body: some View {
        LottieView(animation: .named(fileName))
            .configure({ lottieView in
                lottieView.contentMode = contentMode
            })
            .playbackMode(.playing(.toProgress(1, loopMode: lottieContentMode)))
            .animationDidFinish { completed in
                onAnimationDidFinish?()
            }
    }
}

#Preview {
    LootieBootcamp()
}
