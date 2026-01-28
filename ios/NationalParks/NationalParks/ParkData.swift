
import Foundation
import CoreLocation

struct ParkState: Identifiable {
    let id: String
    let name: String
    let parks: [Park]
}

struct Park: Identifiable, Hashable {
    let id: String
    let name: String
    let state: String
    let description: String?
    let images: [String]
    let coordinates: CLLocationCoordinate2D?
    let directions: String?
    let lodging: [Lodging]?
    let highlights: [String]?
    let entryCost: EntryCost?
    let established: String?
    let size: String?
    let annualVisitors: String?
    
    // Hashable conformance for simple navigation
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Park, rhs: Park) -> Bool {
        lhs.id == rhs.id
    }
}

struct Lodging: Hashable {
    let name: String
    let type: String
    let price: String
    let description: String
}

struct EntryCost: Hashable {
    let vehicle: String
    let motorcycle: String
    let individual: String
    let annual: String
}

class ParkData {
    // Break down states into regions or groups to avoid compiler complexity issues (Mach error -308)
    
    static let statesGroup1: [ParkState] = [
        ParkState(id: "AK", name: "Alaska", parks: [
            Park(id: "denali", name: "Denali National Park", state: "AK", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 63.3333, longitude: -150.5000), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "gates-of-the-arctic", name: "Gates of the Arctic National Park", state: "AK", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 67.7833, longitude: -153.3000), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "glacier-bay", name: "Glacier Bay National Park", state: "AK", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 58.5000, longitude: -137.0000), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "katmai", name: "Katmai National Park", state: "AK", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 58.5000, longitude: -155.0000), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "kenai-fjords", name: "Kenai Fjords National Park", state: "AK", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 59.9167, longitude: -149.6500), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "kobuk-valley", name: "Kobuk Valley National Park", state: "AK", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 67.5500, longitude: -159.2833), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "lake-clark", name: "Lake Clark National Park", state: "AK", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 60.9667, longitude: -153.4167), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "wrangell-st-elias", name: "Wrangell-St. Elias National Park", state: "AK", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 61.0000, longitude: -142.0000), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "AZ", name: "Arizona", parks: [
            Park(id: "grand-canyon", name: "Grand Canyon National Park", state: "AZ", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 36.0544, longitude: -112.1401), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "petrified-forest", name: "Petrified Forest National Park", state: "AZ", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 35.0667, longitude: -109.7833), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "saguaro", name: "Saguaro National Park", state: "AZ", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 32.2500, longitude: -110.5000), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "AS", name: "American Samoa", parks: [
            Park(id: "national-park-of-american-samoa", name: "National Park of American Samoa", state: "AS", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: -14.2583, longitude: -170.6833), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "AR", name: "Arkansas", parks: [
            Park(id: "hot-springs", name: "Hot Springs National Park", state: "AR", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 34.5033, longitude: -93.0552), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "CA", name: "California", parks: [
            Park(id: "channel-islands", name: "Channel Islands National Park", state: "CA", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 34.0069, longitude: -119.7785), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "death-valley", name: "Death Valley National Park", state: "CA", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 36.5323, longitude: -116.9325), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "joshua-tree", name: "Joshua Tree National Park", state: "CA", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 33.8734, longitude: -115.9010), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "kings-canyon", name: "Kings Canyon National Park", state: "CA", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 36.8879, longitude: -118.5551), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "lassen-volcanic", name: "Lassen Volcanic National Park", state: "CA", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 40.4977, longitude: -121.4207), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "pinnacles", name: "Pinnacles National Park", state: "CA", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 36.4869, longitude: -121.1669), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "redwood", name: "Redwood National Park", state: "CA", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 41.2132, longitude: -124.0046), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "sequoia", name: "Sequoia National Park", state: "CA", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 36.4864, longitude: -118.5658), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "yosemite", name: "Yosemite National Park", state: "CA", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 37.8651, longitude: -119.5383), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ])
    ]

    static let statesGroup2: [ParkState] = [
        ParkState(id: "CO", name: "Colorado", parks: [
            Park(id: "black-canyon-of-the-gunnison", name: "Black Canyon of the Gunnison National Park", state: "CO", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 38.5744, longitude: -107.7416), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "great-sand-dunes", name: "Great Sand Dunes National Park", state: "CO", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 37.7916, longitude: -105.5943), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "mesa-verde", name: "Mesa Verde National Park", state: "CO", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 37.2309, longitude: -108.4618), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "rocky-mountain", name: "Rocky Mountain National Park", state: "CO", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 40.3428, longitude: -105.6836), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "FL", name: "Florida", parks: [
            Park(id: "biscayne", name: "Biscayne National Park", state: "FL", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 25.4827, longitude: -80.2083), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "dry-tortugas", name: "Dry Tortugas National Park", state: "FL", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 24.6285, longitude: -82.8732), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "everglades", name: "Everglades National Park", state: "FL", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 25.2866, longitude: -80.8987), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "HI", name: "Hawaii", parks: [
            Park(id: "haleakala", name: "Haleakalā National Park", state: "HI", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 20.7204, longitude: -156.1552), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "hawaii-volcanoes", name: "Hawaiʻi Volcanoes National Park", state: "HI", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 19.4194, longitude: -155.2885), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "IN", name: "Indiana", parks: [
            Park(id: "indiana-dunes", name: "Indiana Dunes National Park", state: "IN", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 41.6533, longitude: -87.0524), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "KY", name: "Kentucky", parks: [
            Park(id: "mammoth-cave", name: "Mammoth Cave National Park", state: "KY", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 37.1862, longitude: -86.1005), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "ME", name: "Maine", parks: [
            Park(id: "acadia", name: "Acadia National Park", state: "ME", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 44.3386, longitude: -68.2733), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "MI", name: "Michigan", parks: [
            Park(id: "isle-royale", name: "Isle Royale National Park", state: "MI", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 47.9959, longitude: -88.9093), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "MN", name: "Minnesota", parks: [
            Park(id: "voyageurs", name: "Voyageurs National Park", state: "MN", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 48.4841, longitude: -92.8271), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "MO", name: "Missouri", parks: [
            Park(id: "gateway-arch", name: "Gateway Arch National Park", state: "MO", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 38.6247, longitude: -90.1848), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ])
    ]

    static let statesGroup3: [ParkState] = [
        ParkState(id: "MT", name: "Montana", parks: [
            Park(
                id: "glacier",
                name: "Glacier National Park",
                state: "MT",
                description: "Crown of the Continent - a spectacular mountain wilderness featuring pristine forests, alpine meadows, rugged mountains, and spectacular lakes.",
                images: [
                    "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800",
                    "https://images.unsplash.com/photo-1501594907352-04cda38ebc29?w=800",
                    "https://images.unsplash.com/photo-1472214103451-9374bd1c798e?w=800"
                ],
                coordinates: CLLocationCoordinate2D(latitude: 48.7596, longitude: -113.7870),
                directions: "Located in northwestern Montana, Glacier is accessible via US Highway 2 from the south and Going-to-the-Sun Road (seasonal). Nearest airports: Glacier Park International Airport (30 miles) and Missoula International Airport (150 miles).",
                lodging: [
                    Lodging(name: "Many Glacier Hotel", type: "Historic Lodge", price: "$200-400/night", description: "Swiss-style chalet on Swiftcurrent Lake"),
                    Lodging(name: "Lake McDonald Lodge", type: "Historic Lodge", price: "$180-350/night", description: "Rustic lodge on the shores of Lake McDonald"),
                    Lodging(name: "Apgar Village Lodge", type: "Cabins", price: "$120-250/night", description: "Cozy cabins near West Glacier entrance"),
                    Lodging(name: "Camping", type: "Campground", price: "$20-30/night", description: "13 campgrounds throughout the park")
                ],
                highlights: [
                    "Going-to-the-Sun Road",
                    "Grinnell Glacier Trail",
                    "Lake McDonald",
                    "Many Glacier Valley",
                    "Wildlife viewing (grizzly bears, mountain goats)"
                ],
                entryCost: EntryCost(vehicle: "$35 (7-day pass)", motorcycle: "$30 (7-day pass)", individual: "$20 (7-day pass)", annual: "$70 (Annual Pass)"),
                established: "May 11, 1910",
                size: "1,013,126 acres",
                annualVisitors: "3 million"
            ),
            Park(
                id: "yellowstone",
                name: "Yellowstone National Park",
                state: "MT",
                description: "America's first national park, home to geysers, hot springs, and diverse wildlife. While primarily in Wyoming, the park extends into Montana and Idaho.",
                images: [
                    "https://images.unsplash.com/photo-1490730141103-6cac27aaab94?w=800",
                    "https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800",
                    "https://images.unsplash.com/photo-1570168007204-dfb528c6958f?w=800"
                ],
                coordinates: CLLocationCoordinate2D(latitude: 44.4280, longitude: -110.5885),
                directions: "Five entrances: North (Gardiner, MT - year-round), Northeast (Cooke City, MT - seasonal), West (West Yellowstone, MT), South (Jackson, WY), and East (Cody, WY). Nearest airports: Bozeman (90 miles), Jackson Hole (60 miles).",
                lodging: [
                    Lodging(name: "Old Faithful Inn", type: "Historic Lodge", price: "$150-500/night", description: "Iconic log structure near Old Faithful geyser"),
                    Lodging(name: "Mammoth Hot Springs Hotel", type: "Hotel", price: "$120-300/night", description: "Historic hotel near the North Entrance"),
                    Lodging(name: "Canyon Lodge", type: "Modern Lodge", price: "$200-400/night", description: "Modern accommodations near Grand Canyon of Yellowstone"),
                    Lodging(name: "Camping", type: "Campground", price: "$20-35/night", description: "12 campgrounds with over 2,000 sites")
                ],
                highlights: [
                    "Old Faithful Geyser",
                    "Grand Prismatic Spring",
                    "Grand Canyon of Yellowstone",
                    "Lamar Valley (wildlife)",
                    "Mammoth Hot Springs"
                ],
                entryCost: EntryCost(vehicle: "$35 (7-day pass)", motorcycle: "$30 (7-day pass)", individual: "$20 (7-day pass)", annual: "$70 (Annual Pass)"),
                established: "March 1, 1872",
                size: "2,219,791 acres",
                annualVisitors: "4 million"
            )
        ]),
        ParkState(id: "NV", name: "Nevada", parks: [
            Park(id: "great-basin", name: "Great Basin National Park", state: "NV", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 38.9833, longitude: -114.3000), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "NM", name: "New Mexico", parks: [
            Park(id: "carlsbad-caverns", name: "Carlsbad Caverns National Park", state: "NM", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 32.1753, longitude: -104.4440), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "white-sands", name: "White Sands National Park", state: "NM", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 32.7872, longitude: -106.3257), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "NC", name: "North Carolina", parks: [
            Park(id: "great-smoky-mountains", name: "Great Smoky Mountains National Park", state: "NC", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 35.6131, longitude: -83.5532), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "ND", name: "North Dakota", parks: [
            Park(id: "theodore-roosevelt", name: "Theodore Roosevelt National Park", state: "ND", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 46.9790, longitude: -103.5387), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "OH", name: "Ohio", parks: [
            Park(id: "cuyahoga-valley", name: "Cuyahoga Valley National Park", state: "OH", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 41.2808, longitude: -81.5678), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "OR", name: "Oregon", parks: [
            Park(id: "crater-lake", name: "Crater Lake National Park", state: "OR", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 42.9446, longitude: -122.1090), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "SC", name: "South Carolina", parks: [
            Park(id: "congaree", name: "Congaree National Park", state: "SC", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 33.7948, longitude: -80.7815), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "SD", name: "South Dakota", parks: [
            Park(id: "badlands", name: "Badlands National Park", state: "SD", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 43.8554, longitude: -102.3397), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "wind-cave", name: "Wind Cave National Park", state: "SD", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 43.5710, longitude: -103.4144), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ])
    ]

    static let statesGroup4: [ParkState] = [
        ParkState(id: "TN", name: "Tennessee", parks: [
            Park(id: "great-smoky-mountains-tn", name: "Great Smoky Mountains National Park", state: "TN", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 35.6131, longitude: -83.5532), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "TX", name: "Texas", parks: [
            Park(id: "big-bend", name: "Big Bend National Park", state: "TX", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 29.1275, longitude: -103.2425), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "guadalupe-mountains", name: "Guadalupe Mountains National Park", state: "TX", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 31.9231, longitude: -104.8609), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "UT", name: "Utah", parks: [
            Park(id: "arches", name: "Arches National Park", state: "UT", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 38.7331, longitude: -109.5925), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "bryce-canyon", name: "Bryce Canyon National Park", state: "UT", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 37.5930, longitude: -112.1871), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "canyonlands", name: "Canyonlands National Park", state: "UT", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 38.3269, longitude: -109.8783), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "capitol-reef", name: "Capitol Reef National Park", state: "UT", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 38.0896, longitude: -111.1355), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "zion", name: "Zion National Park", state: "UT", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 37.2982, longitude: -113.0263), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "VI", name: "U.S. Virgin Islands", parks: [
            Park(id: "virgin-islands", name: "Virgin Islands National Park", state: "VI", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 18.3381, longitude: -64.7423), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "VA", name: "Virginia", parks: [
            Park(id: "shenandoah", name: "Shenandoah National Park", state: "VA", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 38.4755, longitude: -78.4535), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "WA", name: "Washington", parks: [
            Park(id: "mount-rainier", name: "Mount Rainier National Park", state: "WA", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 46.8800, longitude: -121.7269), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "north-cascades", name: "North Cascades National Park", state: "WA", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 48.7718, longitude: -121.2985), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "olympic", name: "Olympic National Park", state: "WA", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 47.8021, longitude: -123.6044), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "WV", name: "West Virginia", parks: [
            Park(id: "new-river-gorge", name: "New River Gorge National Park", state: "WV", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 38.0700, longitude: -81.0800), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ]),
        ParkState(id: "WY", name: "Wyoming", parks: [
            Park(id: "grand-teton", name: "Grand Teton National Park", state: "WY", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 43.7904, longitude: -110.6818), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil),
            Park(id: "yellowstone-wy", name: "Yellowstone National Park", state: "WY", description: nil, images: [], coordinates: CLLocationCoordinate2D(latitude: 44.4280, longitude: -110.5885), directions: nil, lodging: nil, highlights: nil, entryCost: nil, established: nil, size: nil, annualVisitors: nil)
        ])
    ]
    
    static var allStates: [ParkState] {
        return statesGroup1 + statesGroup2 + statesGroup3 + statesGroup4
    }
}
