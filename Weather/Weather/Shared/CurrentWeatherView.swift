//
//  CurrentWeatherView.swift
//  Weather (iOS)
//
//  Created by Toni Kari on 01/02/2021.
//

import Foundation
import Combine

final class CurrentWeatherViewModel:
    ObservableObject{
    @Published var current: Weather?
    
    init(){
        self.fetch()
    }
}

extension CurrentWeatherViewModel {
    func fetch(by city: String = "Lappeenranta"){
        WeatherApi.fetchCurrentWeather(by: city){
            self.current = $0
        }
    }
}
