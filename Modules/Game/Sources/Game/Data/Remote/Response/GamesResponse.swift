//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 06/01/23.
//

import Foundation

public struct GamesResponse: Codable {
	public let results: [GameResponse]
	public let count: Int?

	enum CodingKeys: String, CodingKey {
		case results
		case count
	}
}

public struct GameResponse: Codable {
	public let id: Int?
	public let name: String?
	public let rating: Double?
	public let released: String?
	public let backgroundImage: String?

	enum CodingKeys: String, CodingKey {
		case name
		case id
		case released
		case rating
		case backgroundImage = "background_image"
	}
}
