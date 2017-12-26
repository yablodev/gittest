//: Playground - noun: a place where people can play

import UIKit
//very
var str = "Algoritms on Swift. Beginning."

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = leftNode {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = rightNode {
            s += " -> (\(right.description))"
        }
        return s
    }
}

public class BinarySearchTree<T:Comparable>{
    private(set) var value:T
    private(set) var parent:BinarySearchTree?
    private(set) var leftNode:BinarySearchTree?
    private(set) var rightNode:BinarySearchTree?
    
    convenience init(values:[T]){
        precondition(values.count > 0)
        self.init(value: values.first!)
        for v in values.dropFirst() {
            insert(value: v)
        }
        
    }
    init(value:T){
        self.value = value
    }
    
    func traversalInOrder(process: (T)->()){
        leftNode?.traversalInOrder(process: process)
        process(value)
        rightNode?.traversalInOrder(process: process)
    }
    
    func insert(value: T){
        if value < self.value {
            if let leftNode = leftNode{
                leftNode.insert(value: value)
            }else{
                leftNode = BinarySearchTree(value: value)
                leftNode?.parent = self
            }
        }else{
            if let rightNode = rightNode{
                rightNode.insert(value: value)
            }else{
                rightNode = BinarySearchTree(value: value)
                rightNode?.parent = self
            }
        }
    }
    
    var isRoot:Bool{
        return parent == nil
    }
    var isLeftNode:Bool{
        return parent?.leftNode === self
    }
    
    var count: Int{
        return ((leftNode?.count ?? 0) + 1 + (rightNode?.count ?? 0))
    }
    
    func search(v:T) -> BinarySearchTree?{
        if v < value{
            return leftNode?.search(v: v)
        }else if v > value{
            return rightNode?.search(v: v)
        }else{
            return self
        }
    }
    
    func map(formula: (T) -> T) -> [T]{
        var a = [T]()
        if let left = leftNode { a += left.map(formula: formula) }
        a.append(formula(value))
        if let right = rightNode { a += right.map(formula: formula) }
        return a
    }
    
    func backToArray() -> [T]{
        return map { $0 }
    }
    
    private func reconnectParentToNode(node:BinarySearchTree?) {
        if let parent = parent{
            if parent.leftNode === self{
                parent.leftNode = node
            }else{
                parent.rightNode = node
            }
        }
        node?.parent = parent
    }
    
    func minimum() -> BinarySearchTree {
        var node = self
        while let next = node.leftNode {
            node = next
        }
        return node
    }
    
    func maximum() -> BinarySearchTree {
        var node = self
        while let next = node.rightNode {
            node = next
        }
        return node
    }
    
    func remove() -> BinarySearchTree? {
        var replacement:BinarySearchTree?
        if let right = rightNode{
            replacement = right.minimum()
        }else if let left = leftNode{
            replacement = left.maximum()
        }else{
            replacement = nil
        }
        
        replacement?.remove()
        
        replacement?.leftNode = leftNode
        replacement?.rightNode = rightNode
        rightNode?.parent = replacement
        leftNode?.parent = replacement
        self.reconnectParentToNode(node: replacement)
        
        parent = nil
        leftNode = nil
        rightNode = nil
        
        return replacement
    }
    
}


let tree = BinarySearchTree<Int>(values: [7, 2, 5, 10, 9, 1])
tree.search(v: 2)?.remove()
tree.description
//let process = {value in print(value)}
//tree.traversalInOrder(process: process)
//tree.backToArray()
tree.count


func merge(leftAr:[Int], rightAr:[Int]) -> [Int]{
    var sortedAr = [Int]()
    
    for
    
    return sortedAr
}

func mergeSort(_ ar:[Int]) -> [Int]{
    guard ar.count > 0 {else return ar}
    
    let mid = ar.count / 2
    
    let leftAr = mergeSort(ar[0..<mid])
    let rightAr = mergeSort(ar[mid..<ar.count])
    
    return nil//merge()
}






































