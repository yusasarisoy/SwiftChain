import Foundation

// MARK: - APIManagerProtocol

protocol APIManagerProtocol {
  func makeRequest(from request: RequestProtocol) async throws -> Data
}

// MARK: - APIManager

final class APIManager {
  
  // MARK: - Properties
  
  private let urlSession: URLSession

  // MARK: - Initialization
  
  init(urlSession: URLSession = URLSession.shared) {
    self.urlSession = urlSession
  }
}

// MARK: - APIManagerProtocol

extension APIManager: APIManagerProtocol {
  func makeRequest(from request: RequestProtocol) async throws -> Data {
    let (data, response) = try await urlSession.data(for: request.createURLRequest())
    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200
    else {
      throw NetworkError.invalidServerResponse
    }
    return data
  }
}
