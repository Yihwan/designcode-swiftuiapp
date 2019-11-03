//
//  UpdateStore.swift
//  DesignCode-SwiftUIApp
//
//  Created by Alter Ego on 11/3/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
