//
//  ContentView.swift
//  List_SwiftUI
//
//  Created by AliaksandraHoman on 09/06/2023.
//

import SwiftUI

//MARK: - Content View
struct ContentView: View {
    // properties
    @EnvironmentObject var authentication: Authentication
    @StateObject private var viewModel = ImageListViewModel()
 
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.images.isEmpty {
                    ProgressView()
                } else {
                    List(viewModel.images, id: \.id) { photo in
                        if let url = URL(string: photo.urls.small) {
                            NavigationLink(destination: FullScreenImageView(photo: photo)) {
                                // VStack for FullScreenImageView
                                VStack {
                                    ImageFromUrl(url: url)
                                    Text(photo.description ?? "")
                                }
                            }
                            
                        }
                    }
                    .accentColor(.black)
                    .listStyle(.plain)
                   
                }
                
            }
            .onAppear {
                viewModel.fetchImages()
            }
            .padding()
            .navigationTitle("List App")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Log out") {
                        authentication.updateValidation(success: false)
                    }
                    .colorMultiply(.black)
                }
            }
        }
    }
}

//MARK: - Content View Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
