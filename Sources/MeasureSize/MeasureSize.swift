//
//  MeasureSize.swift
//  
//
//  Created by Michal Tuszynski on 04/09/2022.
//

import Foundation
import SwiftUI

private struct MeasuredSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

private struct MeasureSizeModifier: ViewModifier {
    private var measuringBackground: some View {
        GeometryReader { geo in
            Color.clear
                .frame(width: 1, height: 1)
                .preference(key: MeasuredSizePreferenceKey.self, value: geo.frame(in: .local).size)
        }
    }
    
    func body(content: Content) -> some View {
        return content
            .background(measuringBackground)
    }
}


public extension View {
    /// Measures size of a given view.
    /// - Parameters:
    ///     - measureBlock: Block invoked after the size has been measured
    func measureSize(_ measureBlock: @escaping (CGSize) -> Void) -> some View {
        return modifier(MeasureSizeModifier())
            .onPreferenceChange(MeasuredSizePreferenceKey.self) { measureBlock($0) }
    }
}
