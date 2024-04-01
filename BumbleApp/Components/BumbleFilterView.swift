//
//  BumbleFilterView.swift
//  BumbleApp
//
//  Created by Josue Lubaki on 2024-04-01.
//

import SwiftUI

struct BumbleFilterView: View {
    
    var options : [String] = ["Everyone", "Trending"]
    @Binding var selection : String
    @Namespace private var namespace
    
    var body: some View {
        HStack(alignment : .top, spacing: 32) {
            ForEach(options, id: \.self){ option in
                VStack {
                    Text(option)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    if selection == option  {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "selection", in: namespace)
                    }
                    
                }
                .background(Color.black.opacity(0.001))
                .foregroundStyle(selection == option ? .bumbleBlack : .bumbleGray)
                .onTapGesture {
                    selection = option
                }
            }
        }
        .animation(.smooth, value : selection)
    }
}

fileprivate struct BumbleFilterPreview : View {
    
    var options : [String] = ["Everyone", "Trending"]
    @State private var selection : String = "Everyone"
    
    var body: some View {
        BumbleFilterView(options: options, selection: $selection)
    }
}

#Preview {
    BumbleFilterPreview()
        .padding()
}
