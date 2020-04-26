//
//  Note+Extensions.swift
//  Mooskine
//
//  Created by Timi Tejumola on 26/04/2020.
//  Copyright © 2020 Udacity. All rights reserved.
//

import Foundation
import CoreData

extension Note {
    override public func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
}
