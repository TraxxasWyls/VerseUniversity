//
//  ProgressRingView.swift
//  verse-examples
//
//  Created by incetro on 06/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import VERSE
import SwiftUI

// MARK: - ProgressViewTheme

public struct ProgressViewTheme: Equatable {

    public let lineWidth: CGFloat
    public let startColor: Color
    public let endColor: Color

    public init(
        lineWidth: CGFloat = 15,
        startColor: Color = .red,
        endColor: Color = .blue
    ) {
        self.lineWidth = lineWidth
        self.startColor = startColor
        self.endColor = endColor
    }
}

// MARK: - ProgressRingView

public struct ProgressRingView: View {

    // MARK: - Properties

    /// Current progress value
    private let progress: CGFloat

    private let theme: ProgressViewTheme

    /// Lenght of the inteval. Shoud be a value from 0...1 otherwise 1.
    private let progressIntervalLenght: CGFloat

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - progress: current progress value
    ///   - startColor: start gradient color
    ///   - endColor: end gradient color
    public init(
        progress: CGFloat,
        progressIntervalLenght: CGFloat = 1,
        theme: ProgressViewTheme = .init()
    ) {
        self.theme = theme
        self.progressIntervalLenght = progressIntervalLenght
        self.progress = progress
    }

    // MARK: - View

    public var body: some View {
        ZStack{
            Circle()
                .trim(
                    from: 0,
                    to: CGFloat(min(progressIntervalLenght, 1))
                )
                .stroke(lineWidth: theme.lineWidth)
                .opacity(0.31)
                .foregroundColor(.secondary)
            Circle()
                .trim(
                    from: 0,
                    to: CGFloat(min(min(progress, 1), progressIntervalLenght))
                )
                .stroke(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [theme.startColor, theme.endColor]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    style: StrokeStyle(
                        lineWidth: theme.lineWidth,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                .rotationEffect(Angle(degrees: 270))
        }
    }
}
