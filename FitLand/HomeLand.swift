//
//  HomeLand.swift
//  FitLand
//
//  Created by DPI Student 124 on 7/8/25.
//

import SwiftUI

struct HomeLand: View {
    var body: some View {
        ZStack {
            Image("FitLandHome")
                .resizable()
                .ignoresSafeArea(edges: .all)
                .scaledToFill()
            Image("Character")
                .resizable()
                .scaledToFit()
            
        }
                }
    }

#Preview {
    HomeLand()
}
