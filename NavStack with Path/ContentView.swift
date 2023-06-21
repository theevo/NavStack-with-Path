//
//  ContentView.swift
//  NavStack with Path
//
//  Created by Theo Vora on 6/20/23.
//

import SwiftUI

struct ColorDetail: View {
    var color: Color // 6
    
    var body: some View {
        color.navigationTitle(color.description) // 7
    }
}

struct ContentView: View {
    @State private var path: [Color] = [.green, .mint] // 1

    var body: some View {
        NavigationStack(path: $path)  // 2
        { // 3
            VStack {
                Text("Insert any text here")
                    .font(.largeTitle)
            }
            .navigationDestination(for: Color.self) { color in  // 4
                ColorDetail(color: color) // 5
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
