//
//  NameCard.swift
//  Radon
//
//  Created by Allen Hsu on 2018/12/19.
//  Copyright © 2018 Glow, Inc. All rights reserved.
//

import Foundation

struct NameCardProps: PropsProtocol {
    let children: Array<ElementProtocol>?
    let user: User
}

class NameCard: Component<NameCardProps> {
    override func render() -> ElementProtocol? {
        return nil
    }
}
