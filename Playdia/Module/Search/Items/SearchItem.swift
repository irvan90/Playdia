//
//  SearchItem.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//
// swiftlint:disable line_length

import SwiftUI
import Kingfisher

import PlaydiaCore
import Search
import Game
import Genre

struct SearchItem: View {
	@ObservedObject var presenter: GetListPresenter<Any, SearchDomainModel, Interactor<Any, [SearchDomainModel], GetSearchRepository<GetSearchRemoteDataSource, SearchTransformer>>>
	@State var game: SearchDomainModel?

	var body: some View {
		HStack {
			KFImage.url(URL(string: (game?.backgroundImage) ?? ""))
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 120, height: 80)
				.clipped()
				.cornerRadius(5)

			VStack(alignment: .leading) {
				Text((game?.name)!)
					.font(.system(size: 18))
					.fontWeight(.medium)
					.lineLimit(1)
					.foregroundColor(Color("Default"))
				if let releaseDate = game?.released {
					Text("Release on \(dateFormat(dateTxt: releaseDate))")
						.foregroundColor(Color("Default"))
						.font(.system(size: 12))
				} else {
					Text("Unknown release date")
						.foregroundColor(Color("Default"))
						.font(.system(size: 12))
				}
				HStack(alignment: .lastTextBaseline) {
					Image(systemName: "star.fill")
						.foregroundColor(.orange)
					Text("\(game?.rating ?? 0.0, specifier: "%.2f")")
						.font(.system(size: 16))
						.fontWeight(.regular)
				}
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.horizontal, 10)
			Spacer()
		}.padding(5)
	}
}
