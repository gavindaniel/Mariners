//
//  SettingsHost.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/7/22.
//

import SwiftUI

struct SettingsHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftSettings = Settings.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftSettings = modelData.settings
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                SettingsSummary(settings: modelData.settings)
            } else {
                SettingsEditor(settings: $draftSettings)
                    .onAppear {
                        draftSettings = modelData.settings
                    }
                    .onDisappear {
                        modelData.settings = draftSettings
                    }
            }
        }
        .padding()
    }
}

struct SettingsHost_Previews: PreviewProvider {
    static var previews: some View {
        SettingsHost()
            .environmentObject(ModelData())
    }
}
