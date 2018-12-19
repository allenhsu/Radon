//
//  Node.swift
//  Radon
//
//  Created by Allen Hsu on 2018/12/19.
//  Copyright © 2018 Glow, Inc. All rights reserved.
//

import Foundation

struct Node {
    let component: RenderableProtocol
    let children: Array<Node>?
}
