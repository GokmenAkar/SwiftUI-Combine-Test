//
//  ContentView.swift
//  SwiftUI-Combine-Test
//
//  Created by Developer on 27.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    @State var show: Bool = true
    
    var body: some View {
        VStack {
            Text("Response")
            alert(isPresented: $show) {
                Alert(title: Text("hehe"))
            }
            List(viewModel.articles, id: \.title) { article in
                Text(article.title)
            }
        }
        .onAppear {
            self.viewModel.load()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
