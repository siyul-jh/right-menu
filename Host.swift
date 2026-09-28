import Foundation

// 샌드박스 밖에서 Finder 설정을 바꾸기 위한 헬퍼. 확장이 --toggle-hidden 으로 실행한다.
if CommandLine.arguments.contains("--toggle-hidden") {
    let finder = UserDefaults(suiteName: "com.apple.finder")!
    finder.set(!finder.bool(forKey: "AppleShowAllFiles"), forKey: "AppleShowAllFiles")
    finder.synchronize()
    let kill = Process()
    kill.executableURL = URL(fileURLWithPath: "/usr/bin/killall")
    kill.arguments = ["Finder"]
    try? kill.run()
    kill.waitUntilExit()
}
