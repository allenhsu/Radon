//
//  Component.swift
//  Radon
//
//  Created by Allen Hsu on 2018/12/19.
//  Copyright © 2018 Glow, Inc. All rights reserved.
//

import Foundation

public protocol RenderableProtocol {
    func render() -> ElementProtocol?
}

public protocol ComponentProtocol: RenderableProtocol {
    associatedtype P: PropsProtocol
    var props: P { get set }
    init(props: P)
}

open class Component<P: PropsProtocol>: ComponentProtocol {
    open var props: P
    public required init(props: P) {
        self.props = props
    }
    open func render() -> ElementProtocol? {
        return nil
    }
}

extension Component: CustomStringConvertible {
    public var description: String {
        let t = type(of: self)
        return "\(t)(props: \(props))";
    }
}
