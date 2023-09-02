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
    let date: Int
    @State private var expand: Bool = true
//    @State private var isTextTruncated: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.accentColor)
                .padding(.bottom, 10)
            Text(description)
                .lineLimit(expand ? nil : 2)
            //                    .truncationMode(.tail)
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
                Text("\(String(date)) days ago")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.accentColor)
                    .opacity(0.5)
            }
            .padding(.bottom, 15)
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 50)
                    .foregroundColor(.accentColor)
                // кнопка, которой может и не быть
                Button(action: {
                    expand.toggle()
                }, label: {
                    Text(expand ? "Collapse" : "Expand")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color("BackgroundColor"))
                        .opacity(0.7)
                })
            }
            .padding(.bottom, 10)
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(title: "Charlie Deets",
                 description: "Greetings. I am writing because I discovered a way to improve the taste of decaffeinated and it's very tasty",
                 likes: 1957,
                 date: 21)
    }
}
