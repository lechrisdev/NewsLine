//
//  PostCell.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import SwiftUI

struct PostCell: View {
    
    let id: Int
    let title: String
    let description: String
    let likes: Int
    let daysAgo: String
    
    @State private var expand: Bool = false
    @State private var isTextTruncated: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.accentColor)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 10)
            Text(description)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.accentColor)
                .multilineTextAlignment(.leading)
                .opacity(0.5)

                .lineLimit(expand || !isTextTruncated ? nil : 2)
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .onAppear {
                                let lineHeight = UIFont.systemFont(ofSize: 21, weight: .semibold).lineHeight
                                if geometry.size.height > 50.0 {
                                    isTextTruncated = geometry.size.height > 2 * lineHeight
                                }
                            }
                    }
                )
                .padding(.bottom, 15)
            HStack(spacing: 0) {
                Text("❤️")
                Text(" \(String(likes))")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.accentColor)
                    .opacity(0.5)
                Spacer()
                Text(daysAgo)
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
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.accentColor)
                        .cornerRadius(12)
                        .padding(.bottom, 10)
                })
               
            }
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(id: 12,
                 title: "Charlie Deets",
                 description: "Stay in a ryokan, a top choice of the Japanese for quite a long time.",
                 likes: 1957,
                 daysAgo: "21 days ago")
    }
}
