//
//  ViewModel.swift
//  SwiftUI-Combine-Test
//
//  Created by Developer on 27.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var articles: [Articles] = [Articles]()
    @Published var message: String? = ""
    var cancellable: AnyCancellable?
    
    func load() {
        let url = URL(string: "https://poised-echinacea-q201xlcpzr.glitch.me/top-news")!
        
        cancellable = URLSession.shared.dataTaskPublisher(for: URLRequest(url: url))
            .map(\.data)
            .decode(type: [Articles].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] (completion) in
                self?.message = try? completion.error().localizedDescription
                print(self?.message ?? "")
        }, receiveValue: { (articles) in
            self.articles = articles
        })
    }
}

extension Subscribers.Completion {
    func error() throws -> Failure {
        if case let .failure(error) = self {
            return error
        }
        throw ErrorFunctionThrowsError.error
    }
    
    private enum ErrorFunctionThrowsError: Error {
        case error
    }
}
