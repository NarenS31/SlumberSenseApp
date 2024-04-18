//
//  DashboardView.swift
//  SlumberSense
//
//  Created by Saravanan Saminathan on 4/8/24.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        Spacer()
            NavigationStack {
                TabView {
                    AboutView()
                        .tabItem {
                            Label("About", systemImage: "checkmark.circle")
                    }
                    JournalView()
                        .tabItem {
                            Label("Journal", systemImage: "list.dash")
                    }
                    InfoView()
                        .tabItem {
                            Label("Info", systemImage: "square.and.pencil")
                    }
//                    AccountView()
//                        .tabItem {
//                            Label("Account", systemImage: "person")
//                    }
                }
            }
    }
}
#Preview {
    DashboardView()
}
