//
//  AboutMeView.swift
//  Sport+
//
//  Created by DevTipsy94 on 11/03/2025.
//

import SwiftUI

struct AboutMeView: View {
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("À PROPOS DE MOI")
                .font(.headline)
                .foregroundColor(.white)
            
            Text(description)
                .font(.body)
                .foregroundColor(.gray)
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
}
