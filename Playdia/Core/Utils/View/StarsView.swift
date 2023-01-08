//
//  StarsView.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//

import SwiftUI

struct StarsView: View {
	private static let maxRating: Float = 5 // Defines upper limit of the rating
	private static let color = Color.orange // The color of the stars

	let rating: Float
	private let fullCount: Int
	private let emptyCount: Int
	private let halfFullCount: Int

	init(rating: Float) {
		self.rating = rating
		fullCount = Int(rating)
		emptyCount = Int(StarsView.maxRating - rating)
		halfFullCount = (Float(fullCount + emptyCount) < StarsView.maxRating) ? 1 : 0
	}

	var body: some View {
		HStack {
			ForEach(0..<fullCount, id: \.self) { _ in
				self.fullStar
			}
			ForEach(0..<halfFullCount, id: \.self) { _ in
				self.halfFullStar
			}
			ForEach(0..<emptyCount, id: \.self) { _ in
				self.emptyStar
			}
		}
	}

	private var fullStar: some View {
		Image(systemName: "star.fill")
			.resizable()
			.foregroundColor(StarsView.color)
			.frame(width: 20, height: 20)
	}

	private var halfFullStar: some View {
		Image(systemName: "star.lefthalf.fill")
			.resizable()
			.foregroundColor(StarsView.color)
			.frame(width: 20, height: 20)
	}

	private var emptyStar: some View {
		Image(systemName: "star")
			.resizable()
			.foregroundColor(StarsView.color)
			.frame(width: 20, height: 20)
	}
}
