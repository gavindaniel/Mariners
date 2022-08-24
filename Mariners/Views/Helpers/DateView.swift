//
//  DateView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/24/22.
//

import SwiftUI

struct DateView: View {
    @State private var date = Date()
    
    var body: some View {
        ZStack {
            DatePicker(
                "",
                selection: $date,
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
