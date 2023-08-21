//
//  Text+.swift
//  GetInSwiftUI
//
//  Created by bill on 2023/7/28.
//

import Foundation
import SwiftUI

extension Text {
    func setFontAndColor(size: Double, weight: Font.Weight = .medium, txtColor: Color? = .black) -> some View {
        self.font(Font.system(size: size, weight: weight)).foregroundColor(txtColor)
    }
}
