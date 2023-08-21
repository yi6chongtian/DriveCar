//
//  Color+.swift
//  GetInSwiftUI
//
//  Created by bill on 2023/7/28.
//

import Foundation
import SwiftUI

extension Color {
    static let Color999999 = Color.fromHexString(hexString: "#999999")
    static let Color333333 = Color.fromHexString(hexString: "#333333")
    static let Color323232 = Color.fromHexString(hexString: "#323232")
    static let Color222222 = Color.fromHexString(hexString: "#222222")
}

extension Color {
    static func fromHexString(hexString: String, alpha: Double = 1.0) -> Color? {
        let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
         
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
         
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
         
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
         
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        return Color(red: red, green: green, blue: blue, opacity: alpha)
    }
}

