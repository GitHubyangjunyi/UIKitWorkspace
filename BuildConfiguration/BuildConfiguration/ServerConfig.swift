//
//  ServerConfig.swift
//  BuildConfiguration
//
//  Created by 杨俊艺 on 2021/9/15.
//

import Foundation

enum BaseUrl: String {
    case LOCAL = "https:\\xyz-local.com"
    case QA = "https:\\xyz-qa.com"
    case PROD = "https:\\xyz-prod.com"
    case DEMO = "https:\\xyz-demo.com"
    case DEV = "https:\\xyz-dev.com"
}




class ServerConfig {
    static let shared: ServerConfig = ServerConfig.init()
    
    var baseUrl: String?
    
    func setupServerConfig() {
        #if LOCAL
        self.baseUrl = BaseUrl.LOCAL.rawValue
        #elseif QA
        self.baseUrl = BaseUrl.QA.rawValue
        #elseif PROD
        self.baseUrl = BaseUrl.PROD.rawValue
        #elseif DEMO
        self.baseUrl = BaseUrl.DEMO.rawValue
        #elseif DEV
        self.baseUrl = BaseUrl.DEV.rawValue
        #endif
    }
    
}
