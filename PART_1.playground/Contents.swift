import UIKit

struct User {
    let name: String
    let job: String
}

let allen = User(name: "Allen", job: "iOS Engineer")
let nella = User(name: "Nella", job: "Reenigne SOi")

let users = [allen, nella]

public protocol PropsProtocol {
    var children: Array<ElementProtocol>? { get }
}

public protocol RenderableProtocol {
    func render() -> ElementProtocol?
}

public protocol ComponentProtocol: RenderableProtocol {
    associatedtype P: PropsProtocol
    var props: P { get set }
    init(props: P)
}

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

struct Node {
    let component: RenderableProtocol
    let children: Array<Node>?
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

struct ViewProps: PropsProtocol {
    let children: Array<ElementProtocol>?
}

class View: Component<ViewProps> {
    override func render() -> ElementProtocol? {
        return nil
    }
}

struct TextProps: PropsProtocol {
    let children: Array<ElementProtocol>?
    let text: String?
}

class Text: Component<ViewProps> {
    override func render() -> ElementProtocol? {
        return nil
    }
}

struct NameCardProps: PropsProtocol {
    let children: Array<ElementProtocol>?
    let user: User
}

class NameCard: Component<NameCardProps> {
    override func render() -> ElementProtocol? {
        return nil
    }
}

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

let result = Element<NameCard>(props: NameCardProps(children: nil, user: allen))
//print(result)
let root = Element<NameCardList>(props: NameCardListProps(children: nil, users: users))
//print(root)

func render(_ root: ElementProtocol) -> Node {
    let component = root.createComponent()
    var children: Array<Node> = []
    if let childElement = component.render() {
        children = [render(childElement)]
    }
    return Node(component: component, children: children)
}

print(render(root))
