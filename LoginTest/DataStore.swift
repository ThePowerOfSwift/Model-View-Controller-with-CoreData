//
//  DataStore.swift
//  LoginTest
//
//  Created by Mihail Șalari on 21.03.2016.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation

class DataStore {
    class var defaultLocalDB: CoreDataEngine {
        return CoreDataEngine.sharedInstance
    }
}