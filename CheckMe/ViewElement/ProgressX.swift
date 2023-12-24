//
//  ProgressX.swift
//  CheckMe
//
//  Created by Даниил on 22.12.2023.
//

import SwiftUI

struct ProgressX: View {
    
    var opacity: Int
    
    var barWidth: CGFloat = 300
    var barHeight: CGFloat = 24
    
    var marketWidth: CGFloat {
        barWidth / 3
    }
    
    var markerOffset: CGFloat {
        barWidth * 0.8
    }
    
    @State private var onLeftSide = false
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: .infinity)
                .foregroundStyle(.gray.opacity(0.2))
                .frame(width: barWidth, height: barHeight)
            RoundedRectangle(cornerRadius: .infinity)
                .foregroundStyle(.purple.opacity(Double(opacity) / 10))
                .frame(width: barWidth, height: barHeight)
                .offset(x: onLeftSide ? markerOffset : -markerOffset)
            
            RoundedRectangle(cornerRadius: .infinity)
                .foregroundStyle(.gray.opacity(0.2))
                .frame(width: barHeight, height: barWidth)
            RoundedRectangle(cornerRadius: .infinity)
                .foregroundStyle(.purple.opacity(Double(opacity) / 10))
                .frame(width: barHeight, height: barWidth)
                .offset(y: onLeftSide ? markerOffset : -markerOffset)
        }
        .clipShape(RoundedRectangle(cornerRadius: .infinity))
        .rotationEffect(.degrees(45))
        .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: onLeftSide)
        .onTapGesture {
            onLeftSide.toggle()
        }
        .onAppear {
            onLeftSide = true
        }
        
    }
}

