    //
//  ClearCache.swift
//  Dex4D
//
//  Created by ColdChains on 2018/11/8.
//  Copyright © 2018 龙. All rights reserved.
//

import Foundation
import WebKit

open class ClearCacheManage {
    
    public static func sizeOfAllCache() -> String {
        let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        let fileArr = FileManager.default.subpaths(atPath: cachePath!)
        var size: Double = 0
        for file in fileArr! {
            let path = (cachePath! as NSString).appending("/\(file)")
            let floder = try! FileManager.default.attributesOfItem(atPath: path)
            for (abc, bcd) in floder {
                if abc == FileAttributeKey.size {
                    size += (bcd as AnyObject).doubleValue
                }
            }
        }
        let cache = size / 1024 / 1024
        return String(format: "%.1fM", cache)
    }
    
    public static func clearAllCache() {
        let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        let fileArr = FileManager.default.subpaths(atPath: cachePath!)
        for file in fileArr! {
            let path = (cachePath! as NSString).appending("/\(file)")
            if FileManager.default.fileExists(atPath: path) {
                do {
                    try FileManager.default.removeItem(atPath: path)
                } catch {}
            }
        }
    }
    
    
    public static func clearBrowserCache() {
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), completionHandler: { (records) in
            for record in records{
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {
                    print("清除成功\(record)")
                })
            }
        })
    }
    
    public static func sizeOfBrowserCache() -> String {
        return ""
    }
    
}
