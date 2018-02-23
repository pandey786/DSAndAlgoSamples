//
//  Tree.swift
//  DSAndAlgoSamples
//
//  Created by Durgesh Pandey on 15/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation

/*
 A tree represents hierarchical relationships between objects.
 A tree consists of nodes, and these nodes are linked to one another.

 Nodes have links to their children and usually to their parent as well. The children are the nodes below a given node; the parent is the node above. A node always has just one parent but can have multiple children.

 A node without a parent is the root node. A node without children is a leaf node.
 */

public class TreeNode<T> {
    
    public var value: T
    
    public weak var parent: TreeNode?
    public var children = [TreeNode]()
    
    public init (_ value: T) {
        self.value = value
    }
    
    public func addChild(_ node: TreeNode<T>) {
        children.append(node)
        node.parent = self
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        var s = "\(value)"
        if !children.isEmpty {
            s += " {" + children.map { $0.description }.joined(separator: ", ") + "}"
        }
        return s
    }
}

/*
 We often use the following definitions when talking about trees:
 
 Height of the tree:- This is the number of links between the root node and the lowest leaf. In our example the height of the tree is 3 because it takes three jumps to go from the root to the bottom.
 
 Depth of a node:- The number of links between this node and the root node. For example, the depth of tea is 2 because it takes two jumps to reach the root. (The root itself has depth 0.)
 */

// MARK: - Search Tree
// MARK: -
extension TreeNode where T: Equatable {
    func search(_ value: T) -> TreeNode? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value) {
                return found
            }
        }
        return nil
    }
}
