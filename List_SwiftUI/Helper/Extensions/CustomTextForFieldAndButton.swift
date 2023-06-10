//
//  CustomTextForFieldAndButton.swift
//  List_SwiftUI
//
//  Created by aaa on 09/06/2023.
//

import SwiftUI

// MARK: - extension for Image
extension Image {
    // sizeForNewsPhotos
    func customTextForFieldAndButton() -> some View {
        self
        // dimension setting
            .autocapitalization(.none)
            .font(.system(size: 20, weight: .medium, design: .monospaced))
            .offset(y: -250)
            .padding(.bottom, -150)
            .padding()
    }
}
