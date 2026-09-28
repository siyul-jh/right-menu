import Cocoa

// 샌드박스 밖 헬퍼. 확장이 실행하면(인자 없이) 숨김 파일 표시를 전환한다. build.sh 는 --register 로 실행해 건너뛴다.
// 샌드박스 확장은 실행 인자를 넘기지 못하므로 실행 자체가 동작이다.
func toggleHidden() {
    let prompt = kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String
    // 손쉬운 사용 권한이 있으면 Finder 에 Cmd+Shift+. 를 보낸다 (재시작 없음).
    if AXIsProcessTrustedWithOptions([prompt: true] as CFDictionary),
       let finder = NSRunningApplication.runningApplications(withBundleIdentifier: "com.apple.finder").first {
        for down in [true, false] {
            let event = CGEvent(keyboardEventSource: nil, virtualKey: 47, keyDown: down)!  // 47 = '.'
            event.flags = [.maskCommand, .maskShift]
            event.postToPid(finder.processIdentifier)
        }
        Thread.sleep(forTimeInterval: 0.3)
        return
    }
    // ponytail: 권한이 없으면 설정을 바꾸고 Finder 를 재시작한다 (화면이 깜박임). 권한 부여 후에는 위 경로 사용.
    let finder = UserDefaults(suiteName: "com.apple.finder")!
    finder.set(!finder.bool(forKey: "AppleShowAllFiles"), forKey: "AppleShowAllFiles")
    finder.synchronize()
    let kill = Process()
    kill.executableURL = URL(fileURLWithPath: "/usr/bin/killall")
    kill.arguments = ["Finder"]
    try? kill.run()
    kill.waitUntilExit()
}

if !CommandLine.arguments.contains("--register") { toggleHidden() }
