//
//  RequestModel.swift
//  LogixPro
//
//  Created by Medyannik Dmitri on 01.03.2024.
//  Copyright © 2024 Logix. All rights reserved.
//

import Foundation

struct RequestModel: Codable, Identifiable, Hashable {
    let id: String
    let url: String
    let host: String?
    let port: Int?
    let scheme: String?
    let date: Date
    let method: String
    let headers: [String: String]
    var credentials: [String : String]
    var cookies: String?
    var httpBody: Data?
    var code: Int
    var responseHeaders: [String: String]?
    var dataResponse: Data?
    var errorClientDescription: String?
    var duration: Double?
    
    init(id: String, url: String, host: String?, port: Int?, scheme: String?, date: Date, method: String, headers: [String : String], credentials: [String : String], cookies: String? = nil, httpBody: Data? = nil, code: Int, responseHeaders: [String : String]? = nil, dataResponse: Data? = nil, errorClientDescription: String? = nil, duration: Double? = nil) {
        self.id = id
        self.url = url
        self.host = host
        self.port = port
        self.scheme = scheme
        self.date = date
        self.method = method
        self.headers = headers
        self.credentials = credentials
        self.cookies = cookies
        self.httpBody = httpBody
        self.code = code
        self.responseHeaders = responseHeaders
        self.dataResponse = dataResponse
        self.errorClientDescription = errorClientDescription
        self.duration = duration
    }
    
    var curlRequest: String {
        var components = ["$ curl -v"]

        guard
            let _ = self.host
        else {
            return "$ curl command could not be created"
        }

        if method != "GET" {
            components.append("-X \(method)")
        }
        
        components += headers.map {
            let escapedValue = String(describing: $0.value).replacingOccurrences(of: "\"", with: "\\\"")
            return "-H \"\($0.key): \(escapedValue)\""
        }

        if let httpBodyData = httpBody, let httpBody = String(data: httpBodyData, encoding: .utf8) {
            // the following replacingOccurrences handles cases where httpBody already contains the escape \ character before the double quotation mark (") character
            var escapedBody = httpBody.replacingOccurrences(of: "\\\"", with: "\\\\\"") // \" -> \\\"
            // the following replacingOccurrences escapes the character double quotation mark (")
            escapedBody = escapedBody.replacingOccurrences(of: "\"", with: "\\\"") // " -> \"

            components.append("-d \"\(escapedBody)\"")
        }
        
        for credential in credentials {
            components.append("-u \(credential.0):\(credential.1)")
        }
        
        if let cookies = cookies {
            components.append("-b \"\(cookies[..<cookies.index(before: cookies.endIndex)])\"")
        }

        components.append("\"\(url)\"")

        return components.joined(separator: " \\\n\t")
    }
    
//TODO: - Add Postman
//    var postmanItem: PMItem? {
//        guard
//            let url = URL(string: self.url),
//            let scheme = self.scheme,
//            let host = self.host
//            else { return nil }
//        
//        let dateFormatterGet = DateFormatter()
//        dateFormatterGet.dateFormat = "yyyyMMdd_HHmmss"
//        
//        let name = "\(dateFormatterGet.string(from: date))-\(url)"
//        
//        var headers: [PMHeader] = []
//        let method = self.method
//        for header in self.headers {
//            headers.append(PMHeader(key: header.0, value: header.1))
//        }
//        
//        var rawBody: String = ""
//        if let httpBodyData = httpBody, let httpBody = String(data: httpBodyData, encoding: .utf8) {
//            rawBody = httpBody
//        }
//        
//        let hostList = host.split(separator: ".")
//            .map{ String(describing: $0) }
//        
//        var pathList = url.pathComponents
//        pathList.removeFirst()
//
//        let body = PMBody(mode: "raw", raw: rawBody)
//        
//        let query: [PMQuery]? = url.query?.split(separator: "&").compactMap{ element in
//            let splittedElements = element.split(separator: "=")
//            guard splittedElements.count == 2 else { return nil }
//            let key = String(splittedElements[0])
//            let value = String(splittedElements[1])
//            return PMQuery(key: key, value: value)
//        }
//
//        let urlPostman = PMURL(raw: url.absoluteString, urlProtocol: scheme, host: hostList, path: pathList, query: query)
//        let request = PMRequest(method: method, header: headers, body: body, url: urlPostman, description: "")
//        
//        // build response
//        
//        let responseHeaders = self.responseHeaders?.compactMap{ (key, value) in
//            return PMHeader(key: key, value: value)
//        } ?? []
//        
//        let responseBody: String
//        if let data = dataResponse, let string = String(data: data, encoding: .utf8) {
//            responseBody = string
//        }
//        else {
//            responseBody = ""
//        }
//        
//        let response = PMResponse(name: url.absoluteString, originalRequest: request, status: "", code: code, postmanPreviewlanguage: "html", header: responseHeaders, cookie: [], body: responseBody)
//        
//        return PMItem(name: name, item: nil, request: request, response: [response])
//    }
}

extension RequestModel {
    static func examples() -> [RequestModel] {
        let header = ["Accept-Language": "en",
                      "Content-Type": "application/json",
                      "Accept": "application/json"]
        let first = RequestModel(id: UUID().uuidString, url: "https://jsonplaceholder.typicode.com/posts/120", host: "jsonplaceholder", port: nil, scheme: "https", date: Date(), method: "POST", headers: header, credentials: header, code: 200)
        let second = RequestModel(id: UUID().uuidString, url: "https://jsonplaceholder.typicode.com/posts/120", host: "jsonplaceholder", port: nil, scheme: "https", date: Date(), method: "POST", headers: header, credentials: header, code: 404)
        return [first, second, first]
    }
}
