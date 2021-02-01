//
//  CurrentWeather.swift
//  Weather (iOS)
//
//  Created by Toni Kari on 01/02/2021.
//

import SwiftUI

struct CurrentWeather: View {
    var weather: Weather?
    var height: CGFloat = 0
    var body: some View {
        VStack(alignment: .center) {
            Text("Sää")
                .font(.largeTitle)
                .bold()
                .padding(60)
                .shadow(color: .black, radius: 12)
                .foregroundColor(Color.white)
            Spacer()
            Text("\(weather?.main.temp.round ?? 0) °C")
                .foregroundColor(.white)
                .fontWeight(Font.Weight.heavy)
                .font(.system(size: 65))
                .shadow(color: .black, radius: 5)
            Text("\(weather?.name ?? "Unknown")")
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .padding(.bottom, 300)
                .shadow(color: .black, radius: 6)
            Spacer()
        }
        .background(Image("lappeenranta-hero")
                .resizable()
                .scaledToFill()
                .clipped())
        .edgesIgnoringSafeArea([.top, .bottom])
        
    }
}

struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
    CurrentWeather()
    
}
}
