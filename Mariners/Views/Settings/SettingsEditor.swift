//
//  SettingsEditor.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/7/22.
//

import SwiftUI

struct SettingsEditor: View {
    @Binding var settings: Settings
    
//    var dateRange: ClosedRange<Date> {
//        let min = Calendar.current.date(byAdding: .year, value: -1, to: settings.goalDate)!
//        let max = Calendar.current.date(byAdding: .year, value: 1, to: settings.goalDate)!
//        return min...max
//    }
    
    var body: some View {
        List {
//            HStack {
//                Text("Username").bold()
//                Divider()
//                TextField("Username", text: $settings.username)
//            }
        
            Toggle(isOn: $settings.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
//            VStack(alignment: .leading, spacing: 20) {
//                Text("Seasonal Photo").bold()
//
//                Picker("Seasonal Photo", selection: $settings.seasonalPhoto) {
//                    ForEach(Settings.Season.allCases) { season in
//                        Text(season.rawValue).tag(season)
//                    }
//                }
//                .pickerStyle(.segmented)
//            }
        }
    }
}

struct SettingsEditor_Previews: PreviewProvider {
    static var previews: some View {
        SettingsEditor(settings: .constant(.default))
    }
}
