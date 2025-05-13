//
//  FlippableView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import SwiftUI

public struct FlippableView<Front: View, Back: View>: View {
    @State private var isFlipped = false
    
    let front: Front
    let back: Back
    let animationDuration: Double
    let perspective: CGFloat
    
    public init(
        animationDuration: Double = 0.6,
        perspective: CGFloat = 0.8,
        @ViewBuilder front: () -> Front,
        @ViewBuilder back: () -> Back
    ) {
        self.front = front()
        self.back = back()
        self.animationDuration = animationDuration
        self.perspective = perspective
    }
    
    public var body: some View {
        ZStack {
            front
                .opacity(isFlipped ? 0 : 1)
                .rotation3DEffect(
                    .degrees(isFlipped ? 180 :   0),
                    axis: (x: 0, y: 1, z: 0),
                    perspective: perspective
                )
            
            back
                .opacity(isFlipped ? 1 : 0)
                .rotation3DEffect(
                    .degrees(isFlipped ?   0 : -180),
                    axis: (x: 0, y: 1, z: 0),
                    perspective: perspective
                )
        }
        .animation(.easeInOut(duration: animationDuration), value: isFlipped)
        .onContinuousHover(coordinateSpace: .local) { phase in
            switch phase {
            case .ended:
                isFlipped.toggle()
                
            default:
                break
            }
        }
    }
}
