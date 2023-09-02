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
        ZStack(alignment: .topLeading) {
            Color("BackgroundColor").ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .trailing) {
                    // image = button
                    HStack(spacing: 0) {
                        Spacer()
                        Text("Title")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.accentColor)
                        Spacer()
                    }
                }
                .padding(.bottom, 10)
                Rectangle()
                    .clipped()
                    .frame(height: 1)
                    .foregroundColor(.accentColor).opacity(0.3)
                ScrollView {
                    Spacer(minLength: 20)
                    Group {
                        PostCell(title: "Charlie Deets",
                                 description: "Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty",
                                 likes: 1957,
                                 date: 21)
                        PostCell(title: "Charlie Deets",
                                 description: "Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty",
                                 likes: 1957,
                                 date: 21)
                        PostCell(title: "Charlie Deets",
                                 description: "Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty",
                                 likes: 1957,
                                 date: 21)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(repo: Repository(),
                                          router: Router()))
    }
}
