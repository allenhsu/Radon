//
//  NameCardList.swift
//  Radon
//
//  Created by Allen Hsu on 2018/12/19.
//  Copyright © 2018 Glow, Inc. All rights reserved.
//

import Foundation

struct NameCardListProps: PropsProtocol {
    let children: Array<ElementProtocol>?
    let users: Array<User>
}

class NameCardList: Component<NameCardListProps> {
    override func render() -> ElementProtocol? {
        let children = props.users.map { Element<NameCard>(props: NameCardProps(children: nil, user: $0)) }
        return Element<View>(props: ViewProps(children: children))
    }
}
