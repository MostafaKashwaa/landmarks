//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Mostafa Kashwaa on 17/03/2021.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .renderingMode(.original)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: ModelData().landmarks[0])
            LandmarkRow(landmark: ModelData().landmarks[1])
            Group {
                LandmarkRow(landmark: ModelData().landmarks[0])
                LandmarkRow(landmark: ModelData().landmarks[1])
            }
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
