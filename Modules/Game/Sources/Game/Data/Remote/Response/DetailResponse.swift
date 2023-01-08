//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 08/01/23.
//

import Foundation

struct DetailResponse: Codable {
	public let id: Int?
	public let name: String?
	public let released: String?
	public let rating: Double?
	public let description: String?
	public let backgroundImage: String?
	public let backgroundImageAdditional: String?
	public let parentPlatforms: [Platforms]
	public let genres: [Genre]

	enum CodingKeys: String, CodingKey {
		case name
		case id
		case released
		case rating
		case description
		case backgroundImage = "background_image"
		case backgroundImageAdditional = "background_image_additional"
		case parentPlatforms = "parent_platforms"
		case genres = "genres"
	}
}

struct Platforms: Codable {
	public let platform: Platform

	enum CodingKeys: String, CodingKey {
		case platform
	}
}

struct Platform: Codable {
	public let slug: String?

	enum CodingKeys: String, CodingKey {
		case slug
	}
}

struct Genre: Codable {
	public let name: String?

	enum CodingKeys: String, CodingKey {
		case name
	}
}
