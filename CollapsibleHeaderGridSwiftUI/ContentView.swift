//
//  ContentView.swift
//  CollapsibleHeaderGridSwiftUI
//
//  Created by naresh kukkala on 03/05/22.
//

import SwiftUI

struct ContentView: View {
    
    //let columns = [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))]
    
    
    let columns = [GridItem(.flexible(minimum: 50)),
                      GridItem(.flexible(minimum: 100)),
                      GridItem(.flexible(minimum: 100)),
                      GridItem(.flexible(minimum: 100))
    ]
    
    /*
    let columns = [
           GridItem(.adaptive(minimum: 100)),
           GridItem(.adaptive(minimum: 100))
       ]*/
    
    private func headerView(_ index: Int) -> some View {
        Text("Section \(index)")
            .font(.title)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, pinnedViews: [.sectionHeaders], content: {
                ForEach(1..<11) { section in
                    
                    Section(header: headerView(section)) {
                        ForEach(1..<Int.random(in: 5...20)) { index in
                            Text("Item \(index)")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.green)
                        }
                    }
                    
                    
                }
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().previewLayout(.fixed(width: 480, height: 320))
        }
    }
}
