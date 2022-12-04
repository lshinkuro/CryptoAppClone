//
//  CircleButton.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 04/12/22.
//

import SwiftUI

struct CircleButton: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.accentColor)
            .frame(width: 50,height: 50)
            .background(Circle().foregroundColor(Color.white))
            .shadow(color: Color.accentColor.opacity(0.25),
                    radius: 10,
                    x: 0.0,
                    y: 0.0)
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButton(iconName: "info").previewLayout(.sizeThatFits)
            CircleButton(iconName: "plus").previewLayout(.sizeThatFits).preferredColorScheme(.dark)
        }
    }
}
