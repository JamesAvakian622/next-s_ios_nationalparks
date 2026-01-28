
import SwiftUI
import MapKit

struct MapView: View {
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 39.8283, longitude: -98.5795), // Center of US
            span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50)
        )
    )
    
    // Flatten all parks into a single list
    var allParks: [Park] {
        ParkData.allStates.flatMap { $0.parks }
    }
    
    // Filter parks that have coordinates
    var mapParks: [Park] {
        allParks.filter { $0.coordinates != nil }
    }
    
    @State private var selectedPark: Park?
    
    var body: some View {
        NavigationStack {
            Map(position: $position, selection: $selectedPark) {
                ForEach(mapParks) { park in
                    if let coordinate = park.coordinates {
                        Marker(park.name, coordinate: coordinate)
                            .tag(park)
                    }
                }
            }
            .navigationTitle("Park Map")
            .sheet(item: $selectedPark) { park in
                NavigationStack {
                    ParkDetailView(park: park)
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button("Close") {
                                    selectedPark = nil
                                }
                            }
                        }
                }
            }
        }
    }
}
