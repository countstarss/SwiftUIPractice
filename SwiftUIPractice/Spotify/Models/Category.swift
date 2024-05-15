//
//  Category.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/14.
//

import Foundation

// CaseIterable的作用是让Category成为可迭代数组,遍历生成
enum Category:String,CaseIterable{
    case all, music, podcasts, audiobooks
}

