//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 08/01/23.
//

import Foundation

public struct DetailModel: Equatable, Identifiable, Hashable {
	public let id: Int
	public let name: String
	public let released: String?
	public let rating: Double
	public let description: String?
	public let backgroundImage: String?
	public let backgroundImageAdditional: String?
	public let parentPlatforms: [PlatformsModel]
	public let genres: [GenreModel]

	public func getGenre() -> [String] {
		return genres.map {
			$0.name
		}   }

	public func getPlatform() -> [String] {
		return parentPlatforms.map {
			$0.platform.slug
		}
	}
}

public struct PlatformsModel: Equatable, Hashable {
	public let platform: PlatformModel
}

public struct PlatformModel: Equatable, Hashable {
	public let slug: String
}

public struct GenreModel: Equatable, Hashable {
	public let name: String
}
