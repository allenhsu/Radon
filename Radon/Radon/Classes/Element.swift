//
//  Element.swift
//  Radon
//
//  Created by Allen Hsu on 2018/12/19.
//  Copyright © 2018 Glow, Inc. All rights reserved.
//

import Foundation

public protocol ElementProtocol {
    func createComponent() -> RenderableProtocol
}

struct Element<T: ComponentProtocol>: ElementProtocol {
    let componentClass = T.self
    let props: T.P
    
    func createComponent() -> RenderableProtocol {
        return componentClass.init(props: props)
    }
}
