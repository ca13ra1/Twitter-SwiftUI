//
//  Helpers.swift
//  Twitter
//
//  Created by cole cabral on 2021-05-07.
//

import Foundation

func relativeDate(_ created_at: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEE MMM dd HH:mm:ss Z yyyy"
    let date = dateFormatter.date(from:created_at) ?? Date()
    let formatter = RelativeDateTimeFormatter()
    formatter.unitsStyle = .full
    return formatter.localizedString(for: date, relativeTo: Date())
}
