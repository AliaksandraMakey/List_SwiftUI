//
//  CustomLikeButton.swift
//  List_SwiftUI
//
//  Created by aaa on 09/06/2023.
//

import SwiftUI

// MARK: - CustomLikeButton
struct CustomLikeButton: View {
    // properties
    @State private var isLiked = false
    @State private var likesCount: Int = Int.random(in: 9...999)
    
    var body: some View {
        HStack{
            ZStack {
                // Image
                Image(systemName: "heart.fill")
                    .scaleEffect(isLiked ? 1.0 : 0.0)
                // Image
                Image(systemName: "heart")
                    .foregroundColor(.red)
            }
            .foregroundColor(isLiked ? .red : .white)
            // Text
            Text("\(likesCount)")
                .transition(.opacity.animation(.easeInOut(duration: 0.35)))
            
        }
        .font(.system(size: 20))
        // Tap
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.25)) {
                isLiked.toggle()
                likesCount += isLiked ? 1 : -1
            }
        }
    }
}
// MARK: - CustomLikeButton_Previews
struct CustomLikeButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomLikeButton()
    }
}
