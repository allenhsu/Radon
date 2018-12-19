//
//  Text.swift
//  Radon
//
//  Created by Allen Hsu on 2018/12/19.
//  Copyright © 2018 Glow, Inc. All rights reserved.
//

import Foundation

struct TextProps: PropsProtocol {
    let children: Array<ElementProtocol>?
    let text: String?
}

class Text: Component<ViewProps> {
    override func render() -> ElementProtocol? {
        return nil
    }
}
