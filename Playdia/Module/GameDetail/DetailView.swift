//
//  DetailView.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//

import SwiftUI
import Kingfisher
import Combine
import AlertToast

import PlaydiaCore
import Game

struct DetailView: View {
	@ObservedObject var presenter: GamePresenter

	@State var gameId: Int
	@State var isFavorite: Bool = false

	@State private var showToast = false
	@State private var countPlatform = 0

	var body: some View {
		NavigationView {
			ScrollView {
				if presenter.detailLoadingState {
					HStack {
						Spacer()
						Spinner(isAnimating: true, style: .large).eraseToAnyView()
						Spacer()
					}.padding(.top, 100)
				} else {
					VStack {
						Text(presenter.detail?.name ?? "Title")
							.font(
								Font.custom(
									"InstagramSans-Regular", size: 16
								)
							)
							.font(.headline)
						KFImage.url(URL(string: presenter.detail?.backgroundImage ?? ""))
							.resizable()
							.scaledToFill()
							.frame(width: UIScreen.screenWidth, height: 250)
							.clipped()
							.edgesIgnoringSafeArea(.horizontal)
							.overlay(ImageOverlayView(txt: "\(presenter.detail?.released?.convertToDate() ?? "No data released")",
																				icon: (Image(systemName: "calendar.badge.plus"))), alignment: .bottomTrailing)
							.highPriorityGesture(
								TapGesture(count: 2)
									.onEnded { _ in
										if !self.presenter.detailLoadingState {
											if self.presenter.isFav {
												self.presenter.deleteFavorite()
												showToast.toggle()
											} else {
												self.presenter.addToFavorite()
												showToast.toggle()
											}
										}
									}
							)
						HStack(alignment: .top) {
							VStack(alignment: .leading) {
								Text("Rating")
									.fontWeight(.bold)
									.foregroundColor(.gray)
								StarsView(rating: Float(presenter.detail?.rating ?? 0))
									.frame(minWidth: 0, maxWidth: .infinity, alignment: .top)
								HStack(alignment: .top) {
									Text(String(format: "%.2f / 5", presenter.detail?.rating ?? 0))
										.multilineTextAlignment(.center)
								}.frame(minWidth: 0, maxWidth: .infinity, alignment: .top)
							}
							.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
							Divider()
						}
						.padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
						Spacer()
						Divider()
						HStack(alignment: .top) {
							VStack(alignment: .leading) {
								Text("Platform")
									.fontWeight(.bold)
									.foregroundColor(.gray)

								HStack(alignment: .top) {
									if !self.presenter.detailLoadingState {
										ForEach(0..<(presenter.detail?.parentPlatforms.count ?? 0)) { index in
											PlatformLogoView(slug: presenter.detail!.parentPlatforms[index].platform.slug)
												.padding(EdgeInsets(top: 1, leading: 2, bottom: 2, trailing: 1))
										}
									}
								}
							}
							.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
						}
						.padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
						Spacer()
						Divider()
						Group {
							Text(presenter.detail?.description?.replacingOccurrences(
								of: "<[^>]+>",
								with: "",
								options: .regularExpression,
								range: nil) ?? "")
							.padding(.all)
							Divider()
						}
					}
					.onAppear {
						if !self.presenter.detailLoadingState {
							self.presenter.checkIsFavorite(game: self.presenter.detail!)
						}
					}
				}
			}
			.onAppear {
				self.presenter.getDetailGame(gameId: gameId)
				self.presenter.objectWillChange.send()
			}
		}
		.navigationBarTitleDisplayMode(.inline)
		.navigationBarItems(trailing: Button {
			if !self.presenter.detailLoadingState {
				if self.presenter.isFav {
					self.presenter.deleteFavorite()
				} else {
					self.presenter.addToFavorite()
				}
			}
		} label: {
			Image(systemName: self.presenter.isFav == true ? "heart.circle.fill" : "heart.circle")
				.foregroundColor(self.presenter.isFav == true ? .red : .gray)
		}
		)
		.toast(isPresenting: $showToast) {
			AlertToast(type: .complete(Color.green), title: "Success!")
		}
	}
}
