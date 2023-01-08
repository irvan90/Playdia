//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 06/01/23.
//

import PlaydiaCore

public struct GameTransformer {

	static func mapGamesResponsesToDomains(
		input gameResponses: [GameResponse]
	) -> [GameModel] {

		return gameResponses.map { result in
			return GameModel(
				id: result.id ?? 1,
				name: result.name ?? "",
				rating: result.rating ?? 0.0,
				released: result.released ?? "",
				backgroundImage: result.backgroundImage ?? ""
			)

		}
	}

	static func mapDetailDomainToEntitiy (input detailGame: DetailModel) -> GameEntity {
		let gameEntity = GameEntity()
		gameEntity.id = detailGame.id
		gameEntity.name = detailGame.name
		gameEntity.rating = detailGame.rating
		gameEntity.released = detailGame.released ?? ""
		gameEntity.desc = detailGame.description ?? "No Description"
		gameEntity.image = detailGame.backgroundImage ?? ""
		gameEntity.additionalImage = detailGame.backgroundImageAdditional ?? ""
		for platform in detailGame.parentPlatforms {
			gameEntity.platforms.append(platform.platform.slug)
		}
		for genre in detailGame.genres {
			gameEntity.genre.append(genre.name)
		}
		return gameEntity
	}

	static func mapGameEntitiesToDomains (input favGames: [GameEntity]) -> [DetailModel] {
		return favGames.map { result in
			return DetailModel(
				id: result.id,
				name: result.name,
				released: result.released,
				rating: result.rating,
				description: result.desc,
				backgroundImage: result.image,
				backgroundImageAdditional: result.additionalImage,
				parentPlatforms: result.platforms.map { result in
					return PlatformsModel(platform: PlatformModel(slug: result))
				},
				genres: result.genre.map { result in
					return GenreModel(name: result)
				}

			)
		}
	}

	static func mapDetailResponsesToDomains(
		input detailResponses: DetailResponse
	) -> DetailModel {
		return DetailModel(
			id: detailResponses.id ?? 0,
			name: detailResponses.name ?? "",
			released: detailResponses.released ?? "",
			rating: detailResponses.rating ?? 0.0,
			description: detailResponses.description ?? "",
			backgroundImage: detailResponses.backgroundImage ?? "",
			backgroundImageAdditional: detailResponses.backgroundImageAdditional ?? "",
			parentPlatforms: detailResponses.parentPlatforms.map { result in
				return PlatformsModel(
					platform: PlatformModel(slug: result.platform.slug ?? "")
				)
			},
			genres: detailResponses.genres.map { result in
				return GenreModel(
					name: result.name ?? ""
				)
			}
		)
	}
}
