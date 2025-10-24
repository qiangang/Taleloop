//
//  Timer.swift
//  Taleoop
//
//  Created by Ben on 28/5/2025.
//

import Foundation

public typealias TimerBlock = (Int) -> ()
public typealias TimerCompleteBlock = () -> ()

public class Timer {
    var timer: DispatchSourceTimer?
    
    public init() {
        
    }
}

public extension Timer {
    
    
    func startTiming(maxTime: Int, timerBlock: @escaping TimerBlock, complete: @escaping TimerCompleteBlock) {
 
        timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
        timer?.schedule(deadline: .now(), repeating: .seconds(1))
        
        
        let endTime = NSDate.init(timeIntervalSinceNow: TimeInterval(maxTime))
        
        timer?.setEventHandler {
            let intinterval = endTime.timeIntervalSinceNow
            
            if intinterval >= 0 {
                DispatchQueue.main.async {
                    timerBlock(Int(intinterval))
                }
                
            } else {
                self.timer?.cancel()
                
                DispatchQueue.main.async {
                    complete()
                }
            }
        }
        timer?.resume()
    }
    
    
    
    
    
    
    func cancelTiming() {
        if timer != nil {
            timer!.cancel()
            timer = nil
        }
    }
}
