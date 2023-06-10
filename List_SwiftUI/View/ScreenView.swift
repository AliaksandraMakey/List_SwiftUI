//
//  ScreenView.swift
//  List_SwiftUI
//
//  Created by AliaksandraHoman on 09/06/2023.
//

import SwiftUI

//MARK: - Screen View
struct ScreenView: View {
    var body: some View {
        ZStack {
            LogoView()
                .frame(height: 150)
                .offset(y: -140)
                .padding(.bottom, -150)
        }
    }
}
//MARK: - Screen View Previews
struct ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenView()
    }
}
