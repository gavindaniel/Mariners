//
//  SettingsSummary.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/7/22.
//

import SwiftUI

struct SettingsSummary: View {
    @EnvironmentObject var modelData: ModelData
    var settings: Settings
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
//                Text(settings.username)
//                    .bold()
//                    .font(.title)
                
                Text("Notifications: \(settings.prefersNotifications ? "On" : "Off")")
//                Text("Seasonal Photos: \(settings.seasonalPhoto.rawValue)")
//                Text("Goal Date: ") + Text(settings.goalDate, style: .date)
            
                Divider()
                
//                VStack(alignment: .leading) {
//                    Text("Completed Badges")
//                        .font(.headline)
//                    
//                    ScrollView(.horizontal) {
//                        HStack {
//                            HikeBadge(name: "First Hike")
//                            HikeBadge(name: "Earth Day")
//                                .hueRotation(Angle(degrees: 90))
//                            HikeBadge(name: "Tenth Hike")
//                                .grayscale(0.5)
//                                .hueRotation(Angle(degrees: 45))
//                        }
//                        .padding(.bottom)
//                    }
//                }
                
                Divider()
                
//                VStack(alignment: .leading) {
//                    Text("Recent Hikes")
//                        .font(.headline)
//                    
//                    HikeView(hike: modelData.hikes[0])
//                }
            }
        }
    }
}

struct SettingsSummary_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSummary(settings: Settings.default)
            .environmentObject(ModelData())
    }
}
