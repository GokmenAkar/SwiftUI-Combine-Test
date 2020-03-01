//
//  ContentView.swift
//  SwiftUI-Combine-Test
//
//  Created by Developer on 27.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI
import TestFeature

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    @State var show: Bool = false
    
    var body: some View {
        VStack {
            Text("Response")
            List(viewModel.articles, id: \.title) { article in
                Text(article.title)
            }
            
            Button("press me") {
                self.show.toggle()
            }
        }
        .padding(12)
        .onAppear {
            self.viewModel.load()
        }
            
        .alert(isPresented: $show) {
            Alert(title: Text("hehe"),
                  message: Text("gogo"),
                  dismissButton: .default(Text("ne var lan")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
