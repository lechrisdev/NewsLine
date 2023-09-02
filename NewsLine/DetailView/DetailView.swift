//
//  DetailView.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    
    let url: String = "=https://avatars.githubusercontent.com/u/34?v=4"
    let title: String = "Charlie Deets"
    let post: String = "Greetings. I am writing. Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty.Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty. Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty. Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty. Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty."
    let likes: Int = 957
    let date: String = "23 November 2022"
    
    //    @ObservedObject var viewModel: DetailViewModel
    
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
                        if let url = URL(string: url) {
                            KFImage(url)
                                .onFailureImage(KFCrossPlatformImage(named: "DefaultImage"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    .padding(.bottom, 20)
                    VStack(alignment: .leading, spacing: 0) {
                        Text(title)
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.accentColor)
                            .padding(.bottom, 20)
                        Text(post)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.accentColor)
                            .opacity(0.5)
                            .padding(.bottom, 15)
                        HStack(spacing: 0) {
                            Text("❤️")
                            Text(" \(String(likes))")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.accentColor)
                                .opacity(0.5)
                            Spacer()
                            Text("\(String(date))")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.accentColor)
                                .opacity(0.5)
                        }
                        .padding(.bottom, 15)
                    }
                    .padding(.horizontal, 20)
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
        DetailView()
        //DetailView(viewModel: DetailViewModel())
    }
}
