//
//  CircleButtonAnimation.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 04/12/22.
//

import SwiftUI

struct CircleButtonAnimation: View {
    
    @Binding var animate: Bool
    var delay: Double = 0
    @State private var scale: CGFloat = 0.5
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 4.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation( animate ?
                        Animation.easeOut(duration: 0.6) : .none,
                value: scale)
            .onAppear{
                animate.toggle()
            }
    }
}

struct CircleButtonAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimation(animate: .constant(false))
            .foregroundColor(.red)
            .frame(width: 100, height: 100)
    }
}
