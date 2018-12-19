//
//  Render.swift
//  Radon
//
//  Created by Allen Hsu on 2018/12/19.
//  Copyright © 2018 Glow, Inc. All rights reserved.
//

import Foundation

class Render {
    static func render(_ root: ElementProtocol) -> Node {
        let component = root.createComponent()
        var children: Array<Node> = []
        if let childElement = component.render() {
            children = [render(childElement)]
        }
        return Node(component: component, children: children)
    }
}
