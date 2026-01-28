
import SwiftUI

struct ParkListView: View {
    let states = ParkData.allStates.sorted { $0.name < $1.name }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(states) { state in
                    Section(header: Text(state.name)) {
                        ForEach(state.parks) { park in
                            NavigationLink(value: park) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(park.name)
                                            .font(.headline)
                                        Text(state.name)
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("National Parks")
            .navigationDestination(for: Park.self) { park in
                ParkDetailView(park: park)
            }
        }
    }
}
