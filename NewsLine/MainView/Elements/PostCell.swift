//
//  PostCell.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import SwiftUI

struct PostCell: View {
    
    let title: String
    let description: String
    let likes: Int
    let daysAgo: Int
    
    @State private var expand: Bool = false
    @State private var isTextTruncated: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.accentColor)
                .padding(.bottom, 10)
            Text(description)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.accentColor)
                .opacity(0.5)
                .padding(.bottom, 15)
                .lineLimit(expand || !isTextTruncated ? nil : 2)
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .onAppear {
                                let lineHeight = UIFont.systemFont(ofSize: 20).lineHeight
                                isTextTruncated = geometry.size.height > 2 * lineHeight
                            }
                    }
                )
            HStack(spacing: 0) {
                Text("❤️")
                Text(" \(String(likes))")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.accentColor)
                    .opacity(0.5)
                Spacer()
                Text("\(String(daysAgo)) days ago")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.accentColor)
                    .opacity(0.5)
            }
            .padding(.bottom, 15)
            
            if isTextTruncated {
                Button(action: {
                    withAnimation {
                        expand.toggle()
                    }
                }, label: {
                    Text(expand ? "Collapse" : "Expand")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color("BackgroundColor"))
                        .opacity(0.7)
                })
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.accentColor)
                .cornerRadius(12)
                .padding(.bottom, 10)
            }
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(title: "Charlie Deets",
                 description: "Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty",
                 likes: 1957,
                 daysAgo: 21)
    }
}
