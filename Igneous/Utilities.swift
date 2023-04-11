//
//  Utilities.swift
//  Igneous
//
//  Created by Andrew on 4/11/23.
//

import Foundation

/// Locate and load a plist with a given name.
///
/// - Parameters:
///     - name: The name of the plist file to locate and load.
/// - Returns: The parsed plist as a dictionary. The dictionary will be empty if no matching plist was found.
public func getPlist(withName name: String) -> [String: Any] {
    if let path = Bundle.main.path(forResource: name, ofType: "plist") {
        if let plistData = FileManager.default.contents(atPath: path) {
            do {
                let plist = try PropertyListSerialization.propertyList(from: plistData, options: .mutableContainers, format: nil)
                if let dict = plist as? [String: Any] {
                    return dict
                }
            } catch {
                print("Error loading plist: \(error.localizedDescription)")
            }
        }
    }
    
    return [:]
}
