//
//  ParserService.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 14.10.2022.
//

import Foundation
import SwiftSoup
import ReactiveSwift

public class ParserService: ParserServiceProtocol {
    typealias HTML = String
    var baseUrlString: String {
        "https://student.lpnu.ua/students_schedule"
    }

    var baseUrl: URL {
        URL(string: self.baseUrlString)!
    }

    init() {
    }

    public func days(institute: String, group: String, semester: String = "1") -> SignalProducer<[Day], Error> {
        SignalProducer { [weak self] observer, lifetime in
            guard !lifetime.hasEnded,
                  let self = self,
                  let url = self.buildUrl(baseUrl: self.baseUrlString, params: [
                    (.InstituteKey, institute),
                    (.GroupKey, group),
                    (.SemesterKey, semester)
                  ]) else {
                return
            }
            lifetime += self.html(from: url).map { html -> [Day] in
                do {
                    return try SwiftSoup.parse(html).getElementsByClass("view-grouping").array().map {
                        self.parseDay(element: $0)
                    }.compactMap { $0 }
                } catch {
                    observer.send(error: error)
                    return []
                }
            }.start(observer)
        }
    }

    public func institues() -> SignalProducer<[String], Error> {
        SignalProducer { [weak self] observer, lifetime in
            guard !lifetime.hasEnded,
                  let self = self else {
                return
            }
            lifetime += self.html(from: self.baseUrl).map { html -> [String] in
                do {
                    let element = try SwiftSoup.parse(html).getElementById("edit-departmentparent-abbrname-selective")
                    guard let element else { return [] }
                    return self.childNodesValue(element)
                } catch {
                    observer.send(error: error)
                    return []
                }

            }.start(observer)
        }
    }

    public func studentGroups(institute: String = "All") -> SignalProducer<[String], Error> {
        SignalProducer { [weak self] observer, lifetime in
            guard !lifetime.hasEnded,
                  let self = self,
                  let url = self.buildUrl(baseUrl: self.baseUrlString, params: [
                    (.InstituteKey, institute)
                  ])  else {
                return
            }
            lifetime += self.html(from: url).map { html -> [String] in
                do {
                    guard let element = try SwiftSoup.parse(html)
                        .getElementById("edit-studygroup-abbrname-selective") else {
                        return []
                    }
                    return self.childNodesValue(element)

                } catch {
                    observer.send(error: error)
                    return []
                }
            }.start(observer)
        }
    }

    private func html(from url: URL) -> SignalProducer<HTML, Error> {
        SignalProducer { observer, lifetime in
            guard !lifetime.hasEnded else {
                return
            }
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data {
                    let contents = String(data: data, encoding: .utf8)
                    if let contents {
                        observer.send(value: contents)
                        observer.sendCompleted()
                    } else {
                        observer.send(error: ParserError.InvalidData)
                    }

                }
                if let error {
                    observer.send(error: error)
                }

            }
            task.resume()
        }
    }

    private func parseDay(element: Element) -> Day? {
        guard let lessons = try? element.getElementsByClass("stud_schedule").array(),
              let numbersTags = try? element.getElementsByTag("h3").map({ (try? $0.html()) ?? "" }),
              let title = try? element.getElementsByClass("view-grouping-header").first()?.html() else {
            return nil
        }
        let numbers = numbersTags.map({ Int($0) }).compactMap { $0 }
        guard numbers.count == lessons.count else {
            return nil
        }
        let fullLessons = lessons.enumerated().map { [weak self] index, lesson -> FullLesson? in
            guard let self = self else {
                return nil
            }
            return self.parseLesson(element: lesson, number: numbers[index])
        }.compactMap { $0 }
        return Day(day: title, lessons: fullLessons)
    }

    private func parseLesson(element: Element, number: Int) -> FullLesson? {
        let lessons = element.getChildNodes()
        let res = lessons.map { lesson -> Lesson? in
            let id = try? lesson.attr("id")
            guard let id = id,
                  let position = LessonPosition(rawValue: id),
                  let content = try? element.getElementsByClass("group_content").first()?.html() else {
                return nil
            }
            let contents = content.components(separatedBy: "<br>")
            let urlString = try? element.getElementsByTag("a").first()?.attr("href")
            let url = URL(string: urlString ?? "")
            return Lesson(
                position: position,
                name: contents.element(at: 0).map { String($0) },
                description: contents.element(at: 0).map { String($0) },
                type: contents.element(at: 0).map { String($0) },
                url: url
            )
        }.compactMap { $0 }

        return FullLesson(number: number, lessons: res)
    }

    private func buildUrl(baseUrl: String, params: [(GetParamsKey, String)]) -> URL? {
        guard var urlComponent = URLComponents(string: baseUrl) else {
            return nil
        }
        urlComponent.queryItems = params.map {
            URLQueryItem(name: $0.0.rawValue, value: $0.1)
        }
        return urlComponent.url
    }

    private func childNodesValue(_ element: Element) -> [String] {
        let childNodes = element.getChildNodes()
        let values = childNodes.map {
            try? $0.attr("value")
        }.compactMap { $0 }
        return values
    }
}
