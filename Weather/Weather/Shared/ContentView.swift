//
//  ContentView.swift
//  Shared
//
//  Created by Toni Kari on 01/02/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var selected = 0
    @ObservedObject var weather = CurrentWeatherViewModel()
    @State var city: String = ""
    @State private var isEditing = false
    
    var body: some View {
        VStack() {
            HStack{
            Image(systemName: "magnifyingglass")
                .onTapGesture {
                    onCommit: do {
                        self.weather.fetch(by: self.city)
                    }
                    }
                
                .foregroundColor(.gray)
                .frame(minWidth: 0, maxWidth: 1)
                .padding()
            TextField("Enter your city", text: $city, onCommit: {
                self.weather.fetch(by: self.city)
            }).padding(.horizontal)
            .onTapGesture {
                self.isEditing = true
            }
            
                if isEditing{
                    Button(action: {
                        self.city = ""
                        //self.isEditing = false
                        //self.city = ""
                    }){
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
            
            GeometryReader{ gr in
                CurrentWeather(weather: self.weather.current, height: self.selected == 0 ?
                                gr.size.height: gr.size.height * 0.50).animation(.easeInOut(duration: 1.5))
            }
        }
    }
}

extension Double {
    var round: Int {
        return Int(self)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
