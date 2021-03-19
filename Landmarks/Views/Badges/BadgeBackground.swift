//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Mostafa Kashwaa on 19/03/2021.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(to: CGPoint(
                            x: width * 0.95 + xOffset,
                            y: height * (0.20 + HexagonParameters.adjustment))
                )
                
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            .fill(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color(red: 239 / 255, green: 120 / 255, blue: 221 / 255),
                            Color(red: 239 / 255, green: 172 / 255, blue: 120 / 255)
                        ]
                    ),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
