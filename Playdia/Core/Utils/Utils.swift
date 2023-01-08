//
//  Utils.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//

import WebKit
import SwiftUI
import UIKit

func imageCircle(imageView: UIImageView) {
		imageView.layer.cornerRadius = imageView.frame.size.height / 2
		imageView.layer.masksToBounds = true
		imageView.layer.borderWidth = 0
}

func viewRounded(view: AnyObject, radius: Int) {
		view.layer.cornerRadius = CGFloat(radius)
		view.layer.masksToBounds = true
		view.layer.borderWidth = 0
}

func dateFormat(dateTxt: String) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		guard let date = dateFormatter.date(from: dateTxt) else { return "" }

		dateFormatter.dateFormat = "MMM d, yyyy"
		return dateFormatter.string(from: date)
}
