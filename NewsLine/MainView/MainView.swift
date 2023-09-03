//
//  ContentView.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    @State private var isShowingActionSheet = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
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
                            }).id(UUID())
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
                        //viewModel.sort(by: .rating)
                        isShowingActionSheet = true
                    }, label: {
                        Image("Sorting")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.accentColor)
                    })
                    .actionSheet(isPresented: $isShowingActionSheet) {
                        ActionSheet(
                            title: Text("Make a selection"),
                            message: Text("descending sort"),
                            buttons: [
                                .default(Text("by date")) {
                                    viewModel.sort(by: .date)
                                },
                                .default(Text("by rating")) {
                                    viewModel.sort(by: .rating)
                                },
                                .cancel(), // Добавляет кнопку "Отмена"
                            ]
                        )
                    }
                })
            }
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.secondary)
                Text(viewModel.errorMessage)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.primary)
                    .colorInvert()
                    .padding(4)
            }
            .frame(height: 80)
            .padding(20)
            .offset(y: viewModel.showError ? 0 : 150)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(repo: Repository(),
                                          router: Router()))
    }
}
