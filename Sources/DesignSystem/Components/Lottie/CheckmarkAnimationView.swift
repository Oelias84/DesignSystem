//
//  CheckmarkAnimationView.swift
//  DesignSystem
//
//  Created by Ofir Elias on 16/07/2026.
//

import Lottie
import SwiftUI

public struct CheckmarkAnimationView: View {
    public enum LoopMode {
        case playOnce, loop
        
        var lottieValue: LottieLoopMode {
            switch self {
            case .playOnce: return .playOnce
            case .loop: return .loop
            }
        }
    }
    
    @Binding var loopMode: LoopMode
    private let speed: Double
    private let onFinished: (() -> Void)?
    
    public init(
        loopMode: Binding<LoopMode>,
        speed: Double = 0.8,
        onFinished: (() -> Void)? = nil
    ) {
        self._loopMode = loopMode
        self.speed = speed
        self.onFinished = onFinished
    }
    
    public var body: some View {
        LottieView(animation: .named("checkmark", bundle: .module))
            .playing(loopMode: loopMode.lottieValue)
            .animationSpeed(speed)
            .animationDidFinish { completed in
                if completed { onFinished?() }
            }
    }
}

#Preview {
    CheckmarkAnimationView(loopMode: .constant(.playOnce))
}
