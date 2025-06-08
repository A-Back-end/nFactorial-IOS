import Foundation

class ProductsService {
    private let networkClient = NetworkClient()
    
    func getCharacters(relativePath: String = "/api/character") async throws -> CharactersPage {
        try await networkClient.get(relativePath: relativePath)
    }
    
    func getCharacters(url: URL) async throws -> CharactersPage {
        guard let relativePath = url.relativePathWithQuery else {
            throw URLError(.badURL)
        }
        return try await getCharacters(relativePath: relativePath)
    }
}

extension URL {
    var relativePathWithQuery: String? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return nil
        }

        var path = components.path
        if let query = components.query {
            path += "?\(query)"
        }
        return path
    }
}


