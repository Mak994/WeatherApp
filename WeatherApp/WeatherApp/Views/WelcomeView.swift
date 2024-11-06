//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Mohsin Ali Khaqn on 02/09/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome To The Weather App")
                    .bold().font(.title)
                
                Text("Please Share your current location to get the weather of your area")
                    .padding()
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(50)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
