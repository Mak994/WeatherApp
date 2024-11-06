//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Mohsin Ali Khaqn on 02/09/24.
//

import SwiftUI

struct WeatherView: View {
    var  weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                            
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike .roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    AsyncImage(url: URL(string: "https://img.freepik.com/free-vector/scene-beautiful-cityscape-with-hight-building-shop-street-with-park_1150-48972.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather Now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer.low", name: "Min Temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer.low", name: "Max Temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.allCorners])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
