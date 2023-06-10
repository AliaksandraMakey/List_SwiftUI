//
//  LogoView.swift
//  List_SwiftUI
//
//  Created by AliaksandraHoman on 09/06/2023.
//

import SwiftUI

//MARK: - Logo View
struct LogoView: View {
    
    var body: some View {
        Image("LogoImage")
            .resizable()
             .frame(width: 300.0, height: 300.0)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.black, lineWidth: 10)
            }
            .shadow(radius: 20)
    }
}
//MARK: - Logo View Previews
struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
