//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 08/01/23.
//

import RealmSwift
import Foundation

public class GameEntity: Object {
	@objc public dynamic var id = 0
	@objc public dynamic var name: String = ""
	@objc public dynamic var released: String = ""
	@objc public dynamic var rating: Double = 0.00
	@objc public dynamic var desc: String = ""
	@objc public dynamic var image: String = ""
	@objc public dynamic var additionalImage: String = ""
	@objc public dynamic var clip: String  = ""
	public let platforms = List<String>()
	public let genre = List<String>()

	public override static func primaryKey() -> String? {
		return "id"
	}
}
