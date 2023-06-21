//
//  ContentView.swift
//  NavStack with Path
//
//  Created by Theo Vora on 6/20/23.
//

import SwiftUI

enum Route {
    case results
    case settings
    case resendQuestion
}

struct RouteDetail: View {
    var route: Route // 6
    
    var body: some View {
        switch route { // 7
        case .results:
            VStack { // 8
                Text("96%")
                    .font(.largeTitle.italic())
                    .navigationTitle("Your Score")
            }
        case .settings:
            List { // 9
                Text("Item 1")
                Text("Item 2")
            }
            .navigationTitle("Settings")
        case .resendQuestion:
            Button("Resend question") { // 10
                print("resending!")
            }
        }
    }
}

struct ContentView: View {
    @State private var path: [Route] = [.results, .settings, .resendQuestion] // 1

    var body: some View {
        NavigationStack(path: $path)  // 2
        { // 3
            VStack {
                Text("Insert any text here")
                    .font(.largeTitle)
            }
            .navigationDestination(for: Route.self) { route in  // 4
                RouteDetail(route: route) // 5
            }
            .navigationTitle("Bottom of the Stack")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
