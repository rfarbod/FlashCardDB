//
//  XPProtocol.swift
//  AppDomain
//
//  Created by Farbod Rahiminik on 5/14/25.
//

public protocol XPRepository {
    func getXP() -> Int
    func addXP(points: Int)
    func removeXP(points: Int)
}
