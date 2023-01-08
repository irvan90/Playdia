// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Game",
	platforms: [.iOS(.v15), .macOS(.v10_15)],
	products: [
		// Products define the executables and libraries a package produces, and make them visible to other packages.
		.library(
			name: "Game",
			targets: ["Game"])
	],
	dependencies: [
		// Dependencies declare other packages that this package depends on.
		// .package(url: /* package url */, from: "1.0.0"),
		.package(url: "https://github.com/realm/realm-swift.git", from: "10.33.0"),
		.package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.4")),
		.package(url: "https://github.com/irvan90/PlaydiaCore.git", .upToNextMajor(from: "1.0.1"))
	],
	targets: [
		// Targets are the basic building blocks of a package. A target can define a module or a test suite.
		// Targets can depend on other targets in this package, and on products in packages this package depends on.
		.target(
			name: "Game",
			dependencies: [
					.product(name: "RealmSwift", package: "realm-swift"),
					"PlaydiaCore",
					"Alamofire"
			]),
		.testTarget(
			name: "GameTests",
			dependencies: ["Game"])
	]
)
