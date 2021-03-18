//
//  LandmarksList.swift
//  Landmarks
//
//  Created by Mostafa Kashwaa on 18/03/2021.
//

import SwiftUI

struct LandmarksList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly = false
    
    var filterdLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            !showFavoriteOnly || landmark.isFavorite
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Favorites only")
                }
                ForEach(filterdLandmarks) { item in
                    NavigationLink(destination: LandmarkDetails(landmark: item)) {
                        LandmarkRow(landmark: item)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        let previewDevices = [
//            "iPhone SE (2nd generation)",
            "iPhone XS Max",
//            "iPad Pro (12.9-inch) (4th generation)"
        ]
        ForEach(previewDevices, id: \.self) { deviceName in
            LandmarksList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(ModelData())
    }
}
