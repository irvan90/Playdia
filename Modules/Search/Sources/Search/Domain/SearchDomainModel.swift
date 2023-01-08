//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 06/01/23.
//

import Foundation

public struct SearchDomainModel: Equatable, Identifiable {
	public var id: Int?
	public var name, slug: String?
	public var playtime: Int?
	public var released: String?
	public var rating: Double?
	public var score: String?
	public var backgroundImage: String?
}
