//
//  View.swift
//  Radon
//
//  Created by Allen Hsu on 2018/12/19.
//  Copyright © 2018 Glow, Inc. All rights reserved.
//

import Foundation

struct ViewProps: PropsProtocol {
    let children: Array<ElementProtocol>?
}

class View: Component<ViewProps> {
    override func render() -> ElementProtocol? {
        return nil
    }
}
