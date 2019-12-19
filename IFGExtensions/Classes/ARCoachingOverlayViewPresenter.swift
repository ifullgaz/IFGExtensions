//
//  ARCoachingOverlayViewPresenter.swift
//  IFGExtensions
//
//  Created by Emmanuel Merali on 16/12/2019.
//  Copyright © 2019 Trax Retail. All rights reserved.
//

import ARKit

public protocol ARCoachingOverlayViewPresenter: ARCoachingOverlayViewDelegate {
    func setupCoachingOverlay(in view: ARSCNView) -> ARCoachingOverlayView
}

public extension ARCoachingOverlayViewPresenter {
    @discardableResult
    func setupCoachingOverlay(in view: ARSCNView) -> ARCoachingOverlayView {
        let coachingOverlayView = ARCoachingOverlayView()
        // Set up coaching view
        coachingOverlayView.session = view.session
        coachingOverlayView.delegate = self
        
        coachingOverlayView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(coachingOverlayView)
        
        NSLayoutConstraint.activate([
            coachingOverlayView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coachingOverlayView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            coachingOverlayView.widthAnchor.constraint(equalTo: view.widthAnchor),
            coachingOverlayView.heightAnchor.constraint(equalTo: view.heightAnchor)
            ])

        coachingOverlayView.activatesAutomatically = true
        coachingOverlayView.goal = .tracking
        return coachingOverlayView
    }
}
