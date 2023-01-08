//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 06/01/23.
//
// swiftlint:disable identifier_name

import Foundation

public class DetailGenreResponse: Decodable {
	public var id: Int?
	public var name, slug: String?
	public var games_count: Int?
	public var image_background: String?
	public var description: String?
}
