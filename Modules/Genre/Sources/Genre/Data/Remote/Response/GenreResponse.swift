//
//  File 2.swift
//  
//
//  Created by Muhamad Irvan on 06/01/23.
//
// swiftlint:disable identifier_name

import Foundation

// MARK: - Welcome
public struct GenreResponse: Decodable {
		public let count: Int?
		public let next, previous: String?
		public let results: [GenreResult]?
}

// MARK: - Result
public struct GenreResult: Decodable {
		public let id: Int?
		public let name, slug: String?
		public let games_count: Int?
		public let image_background: String?
		public let games: [GameInGenre]?
}

// MARK: - Game
public struct GameInGenre: Decodable {
		public let id: Int?
		public let name, slug: String?
		public let added: Int?
}
