//
//  LandmarksList.swift
//  Landmarks
//
//  Created by Mostafa Kashwaa on 18/03/2021.
//

import SwiftUI

struct LandmarksList: View {
    @StateObject private var modelData = ModelData()
    @State private var showFavoriteOnly = false
    
    var filterdLandmarks: [Landmark] {
        $modelData.landmarks.wrappedValue.filter { landmark in
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
                    let index = modelData.landmarks.firstIndex(where: {$0.id == item.id})
                    NavigationLink(destination: LandmarkDetails(landmark: item) { isFavorite in
                            modelData.landmarks[index!].isFavorite = isFavorite
                        }) {
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
