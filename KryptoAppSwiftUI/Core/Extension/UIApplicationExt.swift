//
//  UIApplicationExt.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 05/12/22.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
