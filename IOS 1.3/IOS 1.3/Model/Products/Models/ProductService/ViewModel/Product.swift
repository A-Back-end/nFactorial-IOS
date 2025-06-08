import Foundation

struct CharactersPage: Decodable {
    let info: Info
    let results: [Character]

struct Info: Decodable {
        let count: Int
        let pages: Int
        let next: URL?
        let prev: URL?
    }
}

struct Character: Identifiable, Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: URL
    let origin: Location
    let location: Location
    let episode: [URL]
    let url: URL
    let created: String
}

extension Character {
    struct Location: Decodable {
        let name: String
        let url: URL?
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decode(String.self, forKey: .name)
            
            let urlString = try container.decode(String.self, forKey: .url)
            url = URL(string: urlString)
        }
        
        enum CodingKeys: String, CodingKey {
            case name, url
        }
    }
}





