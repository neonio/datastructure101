//
//  Graph.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/17.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
//struct Vertex<T:HashableElement>: HashableElement {
//    var data:T
//    var index:Int
//    var debugDescription: String {
//        return "\(index):\(data.debugDescription)"
//    }
//    var hashValue:Int {
//        return "\(data.hashValue)\(index)".hashValue
//    }
//}
//
//struct Edge<T:HashableElement> :HashableElement{
//    var debugDescription: String {
//        return "from [\(from.debugDescription)] - to [\(to.debugDescription)] <weight:\(weight)>"
//    }
//    
//    let from: Vertex<T>
//    let to:Vertex<T>
//    var weight:Double
//    
//    var hashValue:Int {
//        return "\(from.hashValue)\(to.hashValue)\(weight)".hashValue
//    }
//}
//
//class EdgeList<T:HashableElement> {
//    var vertex:Vertex<T>
//    var edges:[Edge<T>] = []
//    init(vertex:Vertex<T>) {
//        self.vertex = vertex
//    }
//    
//    func addEdge(edge:Edge<T>) {
//        edges.append(edge)
//    }
//}
//
//
//
//class ListGraph<T:HashableElement> {
//    var adjacencyList:[CGVector] = []
//    var vertexs:[Vertex<T>] {
//        var vertexs:[Vertex<T>] = []
//        for edgeList in adjacencyList {
//            vertexs.append(edgeList.vertex)
//        }
//        return vertexs
//    }
//    var edges:[Edge<T>] {
//        var allEdges = Set<Edge<T>>()
//        for edgelist in adjacencyList {
//            for edge in edgelist.edges {
//                allEdges.insert(edge)
//
//            }
//        }
//        return Array(allEdges)
//    }
//    var isDirectionGraph:Bool = false
//    var adjacencyList:[EdgeList<T>] = []
//    func addEdge(from:Vertex<T>, to:Vertex<T>, weight:Double? = nil) {
//        
//    }
//    
//    func addEdge(edge:Edge<T>) {
//        edges.append(edge)
//    }
//}
