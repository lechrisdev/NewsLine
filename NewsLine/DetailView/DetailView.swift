//
//  DetailView.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color("BackgroundColor").ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Rectangle()
                        .clipped()
                        .frame(height: 1)
                        .foregroundColor(.accentColor).opacity(0.3)
                    HStack(spacing: 0) {
                        if let url = URL(string: viewModel.detail?.url ?? "") {
                            KFImage(url)
                                .onFailureImage(KFCrossPlatformImage(named: "DefaultImage"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    .padding(.bottom, 20)
                    if let detail = viewModel.detail {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(detail.title)
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.accentColor)
                                .padding(.bottom, 20)
                            Text(detail.post)
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.accentColor)
                                .opacity(0.5)
                                .padding(.bottom, 15)
                            HStack(spacing: 0) {
                                Text("❤️ ")
                                Text(String(detail.likes))
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.accentColor)
                                    .opacity(0.5)
                                Spacer()
                                Text(String(detail.date))
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.accentColor)
                                    .opacity(0.5)
                            }
                            .padding(.bottom, 15)
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
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(repo: Repository(),
                                              router: Router(),
                                              postId: 112))
    }
}
