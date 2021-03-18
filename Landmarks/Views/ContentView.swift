//
//  ContentView.swift
//  Landmarks
//
//  Created by Mostafa Kashwaa on 17/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarksList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
        .previewDevice("iPhone 12")
        .environmentObject(ModelData())
    }
}
