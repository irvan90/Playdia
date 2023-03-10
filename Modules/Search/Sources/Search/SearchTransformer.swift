//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 06/01/23.
//

import Foundation
import PlaydiaCore

public struct SearchTransformer: Mapper {
	public typealias Entity = [SearchModuleEntity]
	public typealias Response = [SearchResult]
	public typealias Domain = [SearchDomainModel]

	public init() {}

	public func transformResponseToDomain(response: [SearchResult]) -> [SearchDomainModel] {
		return response.map { result in
			return SearchDomainModel(
				id: result.id ?? 0,
				name: result.name ?? "Unknown Name",
				slug: result.slug ?? "Unknown Slug",
				playtime: result.playtime ?? 0,
				released: result.released ?? "Unknown released",
				rating: result.rating ?? 0.0,
				score: result.score ?? "Unknown score",
				backgroundImage: result.background_image ?? ""
			)
		}
	}

	public func transformResponseToEntity(response: [SearchResult]) -> [SearchModuleEntity] {
		return []
	}

	public func transformEntityToDomain(entity: [SearchModuleEntity]) -> [SearchDomainModel] {
		return []
	}
}
