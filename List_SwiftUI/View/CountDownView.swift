//
//  CountDownView.swift
//  List_SwiftUI
//
//  Created by aaa on 09/06/2023.
//

import SwiftUI

//MARK: - Countdown View
struct CountdownView: View {
    // properties
    @Binding var remainingBlockTime: TimeInterval?
    
    var body: some View {
        VStack {
            Text("Input Blocked")
                .font(.title)
                .padding()
            
            if let remainingTime = remainingBlockTime {
                Text("\(Int(remainingTime)) seconds remaining")
                    .font(.headline)
                    .padding()
            } else {
                Text("Input blocked for 30 seconds")
                    .font(.headline)
                    .padding()
            }
        }
        .onReceive(timer) { _ in
            guard var remainingTime = remainingBlockTime else {
                return
            }
            
            if remainingTime > 1 {
                remainingTime -= 1
                remainingBlockTime = remainingTime
            }
        }
    }
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
}
