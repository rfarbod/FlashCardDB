//
//  FlippableView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import SwiftUI

public enum SwipeDirection {
    case up
    case down
    case left
    case right
}

public struct FlippableView<Front: View, Back: View>: View {
    @State private var isFlipped = false
    
    let front: Front
    let back: Back
    let animationDuration: Double
    let perspective: CGFloat
    let swipeThreshold: CGFloat
    let onVerticalSwipe: ((SwipeDirection) -> Void)?
    let onHorizontalSwipe: ((SwipeDirection) -> Void)?
    
    public init(
        animationDuration: Double = 0.6,
        perspective: CGFloat = 0.8,
        swipeThreshold: CGFloat = 50,
        onVerticalSwipe: ((SwipeDirection) -> Void)? = nil,
        onHorizontalSwipe: ((SwipeDirection) -> Void)? = nil,
        @ViewBuilder front: () -> Front,
        @ViewBuilder back: () -> Back
    ) {
        self.front = front()
        self.back = back()
        self.animationDuration = animationDuration
        self.swipeThreshold = swipeThreshold
        self.perspective = perspective
        self.onVerticalSwipe = onVerticalSwipe
        self.onHorizontalSwipe = onHorizontalSwipe
    }
    
    public var body: some View {
        ZStack {
            front
                .frame(width: 300, height: 500)
                .padding()
                .background(Color.pink)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
                .rotation3DEffect(
                    .degrees(isFlipped ? 180 : 0),
                    axis: (x: 0, y: 1, z: 0),
                    perspective: perspective
                )
                .opacity(isFlipped ? 0 : 1)

            back
                .frame(width: 300, height: 500)
                .padding()
                .background(Color.purple)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
                .rotation3DEffect(
                    .degrees(isFlipped ? 0 : -180),
                    axis: (x: 0, y: 1, z: 0),
                    perspective: perspective
                )
                .opacity(isFlipped ? 1 : 0)
        }
        .animation(.easeInOut(duration: animationDuration), value: isFlipped)
        .highPriorityGesture(
            DragGesture(minimumDistance: 50)
                .onEnded { value in
                    let h = value.translation.width
                    let v = value.translation.height
                    
                    if abs(h) > abs(v) {
                        guard abs(h) > swipeThreshold else { return }
                        onHorizontalSwipe?(h > 0 ? .right : .left)
                        withAnimation { isFlipped.toggle() }
                    }
                    
                    if abs(v) > abs(h) {
                        guard abs(v) > swipeThreshold else { return }
                        onVerticalSwipe?(v > 0 ? .up : .down)
                    }
                }
        )
    }
}
