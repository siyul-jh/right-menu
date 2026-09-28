import Foundation

// 샌드박스 밖에서 Finder 설정을 바꾸는 헬퍼. 확장이 실행하면(인자 없이) 숨김 파일 표시를 전환한다.
// 샌드박스 확장은 실행 인자를 넘기지 못하므로, 실행 자체가 동작이다. build.sh 는 --register 로 실행해 건너뛴다.
if !CommandLine.arguments.contains("--register") {
    let finder = UserDefaults(suiteName: "com.apple.finder")!
    finder.set(!finder.bool(forKey: "AppleShowAllFiles"), forKey: "AppleShowAllFiles")
    finder.synchronize()
    let kill = Process()
    kill.executableURL = URL(fileURLWithPath: "/usr/bin/killall")
    kill.arguments = ["Finder"]
    try? kill.run()
    kill.waitUntilExit()
}
