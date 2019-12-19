//
//  TextualRepresentations.swift
//  IFGExtensions
//
//  Created by Emmanuel Merali on 10/12/2019.
//  Copyright © 2019 Trax Retail. All rights reserved.
//

import ARKit

extension ARFrame.WorldMappingStatus: CustomStringConvertible {
    public var description: String {
        switch self {
            case .notAvailable:
                return "Not Available"
            case .limited:
                return "Limited"
            case .extending:
                return "Extending"
            case .mapped:
                return "Mapped"
            default:
                return "Unknown"
        }
    }
}

extension ARCamera.TrackingState: CustomStringConvertible {
    public var description: String {
        switch self {
            case .normal:
                return "Normal"
            case .notAvailable:
                return "Not Available"
            case .limited(.initializing):
                return "Initializing"
            case .limited(.excessiveMotion):
                return "Excessive Motion"
            case .limited(.insufficientFeatures):
                return "Insufficient Features"
            case .limited(.relocalizing):
                return "Relocalizing"
            default:
                return "Unknown"
        }
    }
}

public extension ARCamera.TrackingState {
    var feedback: String {
        switch self {
            case .normal:
                return "Move around to map the environment."
            case .notAvailable:
                return "Tracking unavailable."
            case .limited(.excessiveMotion):
                return "Move the device more slowly."
            case .limited(.insufficientFeatures):
                return "Point the device at an area with visible surface detail, or improve lighting conditions."
            case .limited(.relocalizing):
                return "Resuming session — move to where you were when the session was interrupted."
            case .limited(.initializing):
                return "Initializing AR session."
            default:
                return "Unknown"
        }
    }
}
