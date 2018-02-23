//
//  BinarySearchTree.swift
//  DSAndAlgoSamples
//
//  Created by Durgesh Pandey on 15/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation

/*
 A binary search tree is a special kind of binary tree (a tree in which each node has at most two children) that performs insertions and deletions such that the tree is always sorted.
 */

/*
 Notice how each left child is smaller than its parent node, and each right child is greater than its parent node. This is the key feature of a binary search tree.
 
 Inserting new nodes :-
 When performing an insertion, we first compare the new value to the root node. If the new value is smaller, we take the left branch; if greater, we take the right branch. We work our way down the tree this way until we find an empty spot where we can insert the new value.
 
 */

/*
 There is only one possible place where the new element can be inserted in the tree. Finding this place is usually quick. It takes O(h) time, where h is the height of the tree.
 */

/*
 Searching the tree :-
 To find a value in the tree, we perform the same steps as with insertion:
 
 If the value is less than the current node, then take the left branch.
 If the value is greater than the current node, take the right branch.
 If the value is equal to the current node, we've found it!
 Like most tree operations, this is performed recursively until either we find what we are looking for or run out of nodes to look at.
 */

/*
 Traversing the tree :-
 Sometimes you need to look at all nodes rather than only one.
 
 There are three ways to traverse a binary tree:
 
 In-order (or depth-first): first look at the left child of a node then at the node itself and finally at its right child.
 Pre-order: first look at a node then its left and right children.
 Post-order: first look at the left and right children and process the node itself last.
 Traversing the tree also happens recursively.
 */

public class BinarySearchTree<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    public init(value: T) {
        self.value = value
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    // MARK: - Insert
    // MARK: -
    public func insert(value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
    
    // MARK: - Init with Array
    // MARK: -
    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for v in array.dropFirst() {
            insert(value: v)
        }
    }
}

// MARK: - Description
// MARK: -
extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
}
