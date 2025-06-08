import Foundation

class NetworkClient {
    private let BASE_URL = "https://rickandmortyapi.com"
    
    func get<Response: Decodable>(
        relativePath: String
    ) async throws -> Response {
        guard
            let url = URL(string: BASE_URL + relativePath)
        else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(Response.self, from: data)
        return response
    }
    
    func post<Body: Encodable, Response: Decodable>(
        relativePath: String,
        body: Body
    ) async throws -> Response {
        guard
            let url = URL(string: BASE_URL + relativePath)
        else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(Response.self, from: data)
        
        return response
    }
}





