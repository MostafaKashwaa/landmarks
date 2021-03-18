//
//  LandmarkDetails.swift
//  Landmarks
//
//  Created by Mostafa Kashwaa on 17/03/2021.
//

import SwiftUI

struct LandmarkDetails: View {
    var landmark: Landmark
    let onToggleFavorite: (_ isFavotire: Bool) -> ()
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    Spacer()
                    FavoriteButton(isSet: landmark.isFavorite, onFavoriteChange: onToggleFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetails_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetails(landmark: ModelData().landmarks[0]) {_ in }
            .previewDevice("iPhone 11 Pro")
    }
}
