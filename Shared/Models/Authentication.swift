//
//  Authentication.swift
//  ElsaClient
//
//  Created by Daniel Caris on 27-03-22.
//

import Foundation

struct Profile: Decodable {
    let phone: String
    let username: String
    let external_id: String
    let native_language: String
    let last_activity: String
    let native_score: Float
    let ons: Float
    let eps: Float
    let scoring_version: Int
    let registration_date: String
    let native_strictness: Bool
    let finish_onboard: Bool
    let is_bootstrap: Bool
    let free_trial: String
    let accept_notifications: Bool
    let location: String
    let self_proficiency: Int
}

struct Authentication: Decodable {
    let message: String
    let profile: Profile
    let session: String
    let refresh_token: String
}

//{    "message": "Login accepted.",    "profile": {        "phone": "",        "username": "daniel.caris22",        "external_id": "LgV2BSQRIjJcECkrEik6CT8gPj0mOXclGmNTMhxmDUQ=",        "native_language": "",        "last_activity": "20220303131015",        "native_score": 83.47,        "ons": 83.47,        "eps": 80.42,        "scoring_version": 2,        "registration_date": "20211113",        "native_strictness": false,        "finish_onboard": false,        "is_bootstrap": true,        "firebase_id": null,        "mini_program": true,        "difficulty": null,        "daily_reminder": null,        "display_language": null,        "sound_effect_volume": null,        "learning_commitment": null,        "fb_id": null,        "accept_notifications": false,        "free_trial": "",        "location": "CL",        "self_proficiency": 3    },    "session": "F3S0w0bysBQFdbjtxpFurovL6CNeK9O0/Zv6HrCUsyaNBRMFGiTosueQfeSWq6NwBHdUo41wGn/tWgGRiD9GnwNnxsYqy1cBkwu/fm4pZWztxuZ/jO3Ttc3amS8pXGpx9MxsXaDWU8zM+2PBSWNQDJqEfPKZQcFOfZjw4HojNDanR0D4z1O0rFLx+xW0k3NMBtfrm/K5EMz6O7g7f1/t/A==",    "refresh_token": "55029131"}

