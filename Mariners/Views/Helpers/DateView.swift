//
//  DateView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/24/22.
//

import SwiftUI

struct DateView: View {
    @EnvironmentObject var globalVariables: GlobalVariables
    
    var body: some View {
        ZStack {
            DatePicker(
                "",
                selection: $globalVariables.myDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(.compact)
        }
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
