//
//  View+.swift
//  GetInSwiftUI
//
//  Created by bill on 2023/8/2.
//

import Foundation
import SwiftUI

extension View {
    func readGeometry<Key: PreferenceKey, Value>(_ keyPath: KeyPath<GeometryProxy, Value>, key: Key.Type) -> some View where Key.Value == Value {
        overlay {
            GeometryReader { proxy in
                Color.clear.preference(key: key,
                                       value: proxy[keyPath: keyPath])
            }
        }
    }
}
