//
//  Twitter_Widget.swift
//  Twitter Widget
//
//  Created by cole cabral on 2021-05-07.
//

import WidgetKit
import SwiftUI
import Intents
import Combine

private var cancellables = Set<AnyCancellable>()

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), twitter:[])
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "screen_name", value:"\(configuration.screenName ?? "")" ),
            URLQueryItem(name: "count", value:"4")
        ]
        components.scheme = "https"
        components.host = "api.twitter.com"
        components.path = "/1.1/statuses/user_timeline.json"
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.addValue("Mozilla/5.0 (Macintosh; Intel Mac OS X x.y; rv:42.0) Gecko/20100101 Firefox/42.0", forHTTPHeaderField: "User-Agent")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \("API BEARER TOKEN")", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTaskPublisher(for: request)
            .map{ $0.data }
            .decode(type: Twitter.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("\(error)")
                    print(components.url!)
                }
            }, receiveValue: { twitter in
                let entry = SimpleEntry(date: Date(), configuration: ConfigurationIntent(), twitter: twitter)
                completion(entry)
            }).store(in: &cancellables)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        let entryDate = Calendar.current.date(byAdding: .hour, value: 1, to: currentDate)!
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "screen_name", value:"\(configuration.screenName ?? "")" ),
            URLQueryItem(name: "count", value:"4")
        ]
        components.scheme = "https"
        components.host = "api.twitter.com"
        components.path = "/1.1/statuses/user_timeline.json"
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.addValue("Mozilla/5.0 (Macintosh; Intel Mac OS X x.y; rv:42.0) Gecko/20100101 Firefox/42.0", forHTTPHeaderField: "User-Agent")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \("API BEARER TOKEN")", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTaskPublisher(for: request)
            .map{ $0.data }
            .decode(type: Twitter.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("\(error)")
                    print(components.url!)
                }
            }, receiveValue: { twitter in
                let entry = SimpleEntry(date: entryDate, configuration: configuration, twitter: twitter)
                entries.append(entry)
                let timeline = Timeline(entries: entries, policy: .atEnd)
                completion(timeline)
            }).store(in: &cancellables)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let twitter: Twitter
}

struct Twitter_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            TwitterSmallView(twitter:entry.twitter)
        case .systemMedium:
            TwitterMediumView(twitter:entry.twitter)
        case .systemLarge:
            TwitterLargeView(twitter:entry.twitter)
        @unknown default:
            EmptyView()
        }
    }
}

@main
struct Twitter_Widget: Widget {
    let kind: String = "Twitter_Widget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            Twitter_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Twitter")
        .description("Most recent Tweets, Retweets, replies, and Quote Tweets, similar to what may be seen on a user's profile timeline")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct Twitter_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Twitter_WidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), twitter: []))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
