//
//  CircleImage.swift
//  Landmarks
//
//  Created by Mostafa Kashwaa on 17/03/2021.
//

import SwiftUI

struct CircleImage: View {
    let image: Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }

}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleImage(image: Image("turtleRock"))
                .preferredColorScheme(.light)
                
            CircleImage(image: Image("turtleRock"))
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
