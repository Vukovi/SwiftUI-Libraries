//
//  SwiftfulUIBootcamp.swift
//  SwiftUI Libraries
//
//  Created by Vuk Knezevic on 05.04.24.
//

import SwiftUI
import SwiftfulUI

struct SomeItem: Identifiable {
    let id: String = UUID().uuidString
    let color: Color = .red
}

struct SwiftfulUIBootcamp: View {
    
    @State private var isActive: Bool = false
    
    @State private var items: [SomeItem] = [
        SomeItem(),
        SomeItem(),
        SomeItem(),
        SomeItem(),
        SomeItem()
    ]
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .withGradientBackgroundAnimatable(
                    isActive: isActive,
                    activeGradient: LinearGradient(
                        colors: [Color.red, Color.blue],
                        startPoint: .leading,
                        endPoint: .trailing),
                    defaultGradient: LinearGradient(
                        colors: [Color.green, Color.orange],
                        startPoint: .leading,
                        endPoint: .trailing), 
                    cornerRadius: 10
                )
            .padding()
            
    //            .asButton(
    //                scale: 0.7,
    //                opacity: 0.5,
    //                brightness: 0.5) {
    //                    withAnimation {
    //                        isActive.toggle()
    //                    }
    //                }
            
    //            .readingLocation { location in
    //                print("CGPoint:", location)
    //            }
            
    //            .readingFrame { frame in
    //                print("CGRct:", frame)
    //            }
            
    //            .withDragGesture(
    //                [.vertical, .horizontal],
    //                minimumDistance: 0
    ////                animation: T##Animation,
    ////                rotationMultiplier: T##CGFloat,
    ////                scaleMultiplier: T##CGFloat
    //            ) { dragOffset in
    //                    print("gde sam trenutno", dragOffset)
    //                } onEnded: { dragOffset in
    //                    print("gde sam konacno", dragOffset)
    //                }
        }

        NonLazyVGrid(
            columns: 3,
            alignment: .leading,
            spacing: 16,
            items: items) { item in
                if let item = item {
                    item.color
                        .frame(height: 50)
                        .frame(width: item.id == items.first?.id ? 50 : nil)
                }
            }
            .padding(40)
        
        
        CustomProgressBar(
             selection: 50,
             range: 0...100,
             backgroundColor: .green,
             foregroundColor: .black,
             cornerRadius: 10,
             height: 20)
        .padding()

    }
}

#Preview {
    SwiftfulUIBootcamp()
}
