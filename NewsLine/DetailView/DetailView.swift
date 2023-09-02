//
//  DetailView.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color("BackgroundColor").ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 0) {
                    Spacer()
                    Text("Title")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.accentColor)
                    Spacer()
                }
                .padding(.bottom, 10)
                Rectangle()
                    .clipped()
                    .frame(height: 1)
                    .foregroundColor(.accentColor).opacity(0.3)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel())
    }
}
