//
//  MyActivity.swift
//  FitLand
//
//  Created by DPI Student 124 on 7/8/25.
//

import SwiftUI

struct MyActivity: View {
    var body: some View {
        Image("FitLandActivity")
            .resizable()
            .ignoresSafeArea(edges: .all)
            .scaledToFill()
    }
}

#Preview {
    MyActivity()
}
