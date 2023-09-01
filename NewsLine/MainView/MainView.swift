//
//  ContentView.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            Button(action: {
                viewModel.router.showDetailViewScreen()
            }, label: {
                Text("First Screen")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(repo: Repository(),
                                          router: Router()))
    }
}
