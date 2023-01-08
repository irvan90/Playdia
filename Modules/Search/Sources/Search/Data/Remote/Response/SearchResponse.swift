//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 06/01/23.
//
// swiftlint:disable identifier_name

import Foundation

public struct SearchResponse: Decodable {
		var count: Int?
		var next, previous: String?
		var results: [SearchResult]?
}

public struct SearchResult: Decodable {
		var id: Int?
		var name, slug: String?
		var playtime: Int?
		var released: String?
		var rating: Double?
		var score: String?
		var background_image: String?
}
