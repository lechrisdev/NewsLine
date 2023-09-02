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
                Rectangle()
                    .clipped()
                    .frame(height: 1)
                    .foregroundColor(.accentColor).opacity(0.3)
                ScrollView {
                    Spacer(minLength: 20)
                    Group {
                        PostCell(title: "Charlie Deets",
                                 description: "Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty. Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty.",
                                 likes: 1957,
                                 daysAgo: 21)
                        PostCell(title: "Charlie Deets",
                                 description: "Greetings. I am writing. Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty.Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty. Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty. Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty. Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty",
                                 likes: 5,
                                 daysAgo: 1)
                        PostCell(title: "Charlie Deets",
                                 description: "Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty.",
                                 likes: 999,
                                 daysAgo: 15)
                        PostCell(title: "Charlie Deets",
                                 description: "Greetings. I am writing.",
                                 likes: 55,
                                 daysAgo: 3)
                        
                    }
                    .padding(.horizontal, 20)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Title")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.accentColor)
                }
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        // ADD SORTING
                        viewModel.router.showDetailViewScreen()
                    }, label: {
                        Image("Sorting")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.accentColor)
                    })
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(repo: Repository(),
                                          router: Router()))
    }
}
