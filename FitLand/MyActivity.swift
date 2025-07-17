//
//  MyActivity.swift
//  FitLand
//
//  Created by DPI Student 124 on 7/8/25.
//

import SwiftUI

struct MyActivity: View {
    var body: some View {
        
        VStack {
            Image("FitLandActivity")
                .resizable()
                .ignoresSafeArea(edges: .all)
                .scaledToFill()

            Text("My Activity")
                .font(.body)
                .padding()
        }
        
    }
}

#Preview {
    MyActivity()
}
