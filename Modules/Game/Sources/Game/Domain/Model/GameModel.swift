//
//  GameModel.swift
//  PlaydiaApp
//
//  Created by Muhamad Irvan on 11/12/22.
//

import Foundation

public struct GameModel: Equatable, Identifiable {
	public let id: Int
	public let name: String
	public let rating: Double
	public var released: String?
	public let backgroundImage: String?
}
