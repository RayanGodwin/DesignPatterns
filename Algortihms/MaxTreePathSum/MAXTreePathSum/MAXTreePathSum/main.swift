//
//  main.swift
//  MAXTreePathSum
//
//  Created by Rayan Godwin Sequeira on 04/06/25.
//

import Foundation

class BinaryTreeNode {
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    var value: Int
    
    init(_ value: Int) {
        self.value = value
    }
}

func maxPathSum(_ root: BinaryTreeNode?) -> Int {
    var maxSum = Int.min
    dfs(root, result: &maxSum)
    return maxSum
}

@discardableResult
func dfs(_ node: BinaryTreeNode?, result: inout Int) -> Int {
    guard let node else {
        return 0
    }
    
    let leftChildSum = dfs(node.leftChild, result: &result)
    let rightChildSum = dfs(node.rightChild, result: &result)
    
    let currentSum = node.value + leftChildSum + rightChildSum
    result = max(result, currentSum)
    
    return node.value + max(leftChildSum, rightChildSum)
}

func main() {
    let root = BinaryTreeNode(-10)
    root.leftChild = BinaryTreeNode(9)
    root.rightChild = BinaryTreeNode(20)
    root.rightChild?.leftChild = BinaryTreeNode(15)
    root.rightChild?.rightChild = BinaryTreeNode(7)

    print(maxPathSum(root))
}

main()
