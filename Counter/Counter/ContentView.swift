//
//  ContentView.swift
//  Counter
//
//  Created by 杨俊艺 on 2020/7/1.
//

import SwiftUI

struct ContentView: View {
    @State var counter = 0
    var body: some View {
        VStack{
            Button(action: { self.counter += 1 }, label: {
                Text("Tap Me!")
                    .padding()
                    .background(Color(.tertiarySystemFill))
                    .cornerRadius(5.0)
            })
            
            if counter > 0{
                Text("You've tapped \(counter) times")
            } else {
                Text("You've not yet tapped")
            }
        }.debug()
    }
}

extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
