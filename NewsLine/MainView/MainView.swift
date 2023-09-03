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
                        ForEach(Array(viewModel.posts.enumerated()), id: \.offset) { index, post in
                            Button(action: {
                                viewModel.router.showDetailViewScreen(postId: post.id)
                            }, label: {
                                PostCell(id:            post.id,
                                         title:         post.title,
                                         description:   post.description,
                                         likes:         post.likes,
                                         daysAgo:       post.daysAgo)
                            })
                        }
                        HStack(spacing: 0) {
                            if viewModel.isLoading {
                                Spacer()
                                ProgressView()
                                    .progressViewStyle(.circular)
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("NewsLine")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.accentColor)
                }
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        // ADD SORTING
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
