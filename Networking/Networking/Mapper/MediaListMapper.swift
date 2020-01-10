import Foundation


/// Mapper: Media List
///
class MediaListMapper: Mapper {

    /// (Attempts) to convert a dictionary into an Account entity.
    ///
    func map(response: Data) throws -> [Media] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.Defaults.iso8601)
        return try decoder.decode(MediaListEnvelope.self, from: response).mediaList
    }
}

/// ProductEnvelope Disposable Entity:
/// `Load All Products` endpoint returns the updated products document in the `data` key.
/// This entity allows us to do parse all the things with JSONDecoder.
///
private struct MediaListEnvelope: Decodable {
    let mediaList: [Media]

    private enum CodingKeys: String, CodingKey {
        case mediaList = "media"
    }
}