//
//  Config.swift
//  Article
//
//  Created by GÖKMEN AKAR on 1.03.2020.
//  Copyright © 2020 GÖKMEN AKAR. All rights reserved.
//

import Foundation

public func setup(with config: AnalyticsConfig.Type) {
    ConfigType.shared = ConfigType(config)
}

public protocol AnalyticsConfig {
    static var analyticsKey: String { get }
    static var appVersion: String { get }
}

final class ConfigType {
    static fileprivate var shared: ConfigType?
    
    let analyticsKey: String
    let appVersion: String
    
    fileprivate init(_ config: AnalyticsConfig.Type) {
        self.analyticsKey = config.analyticsKey
        self.appVersion = config.appVersion
    }
}

var Config: ConfigType { // swiftlint:disable:this variable_name
    if let config = ConfigType.shared {
        return config
    } else {
        fatalError("Please set the Config for \(Bundle(for: ConfigType.self))")
    }
}



