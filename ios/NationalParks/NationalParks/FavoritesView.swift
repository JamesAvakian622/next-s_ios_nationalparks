import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        NavigationView {
            if favorites.isEmpty {
                VStack(spacing: 20) {
                    Image(systemName: "heart.slash")
                        .font(.system(size: 60))
                        .foregroundColor(.gray)
                    Text("No Favorites Yet")
                        .font(.title)
                        .foregroundColor(.gray)
                    Text("Explore parks and tap the heart icon to add them to your trip list.")
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundColor(.secondary)
                }
                .navigationTitle("My Trips")
            } else {
                List {
                    ForEach(favorites) { park in
                        NavigationLink(destination: ParkDetailView(park: park)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(park.name)
                                        .font(.headline)
                                    Text(park.state)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                                if !favoritesManager.getNotes(parkId: park.id).isEmpty {
                                    Image(systemName: "note.text")
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("My Trips")
            }
        }
    }
    
    var favorites: [Park] {
        let allParks = ParkData.allStates.flatMap { $0.parks }
        return allParks.filter { favoritesManager.isFavorite(parkId: $0.id) }
    }
}
