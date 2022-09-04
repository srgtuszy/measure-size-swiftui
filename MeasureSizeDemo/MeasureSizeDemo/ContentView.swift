//
//  ContentView.swift
//  MeasureSizeDemo
//
//  Created by Michal Tuszynski on 04/09/2022.
//

import SwiftUI
import MeasureSize

struct ContentView: View {
    @State private var labelWidth: CGFloat = 0
    @State private var imageHeight: CGFloat = 0
    
    var body: some View {
        VStack {
            Text("Hello, this label's width is: \(labelWidth)")
                .measureSize { labelWidth = $0.width }
                .padding()
            Text("And this image's height is: \(imageHeight)")
            Image(systemName: "ruler.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .measureSize { imageHeight = $0.height }
        }
    }
}

#if DEBUG

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#endif
