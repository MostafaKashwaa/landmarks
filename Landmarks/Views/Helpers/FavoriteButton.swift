//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Mostafa Kashwaa on 18/03/2021.
//

import SwiftUI

struct FavoriteButton: View {
    @State var isSet: Bool
    let onFavoriteChange: (_ isFavotire: Bool) -> ()
    
    var body: some View {
        Button(action: {
            isSet.toggle()
            onFavoriteChange(isSet)
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .renderingMode(.original)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FavoriteButton(isSet: true) {_ in }
            FavoriteButton(isSet: false) {_ in }
        }
        .previewLayout(.sizeThatFits)
    }
}
