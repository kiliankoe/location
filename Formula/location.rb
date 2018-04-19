class Location < Formula
    desc "cli to get your device's physical location and output it as json."
    homepage "https://github.com/kiliankoe/location"
    url "https://github.com/kiliankoe/location/archive/0.2.1.tar.gz"
    sha256 "562eb522f133a578630a359c0f2f83ed51e243c7a090f96cea7e3db7961f100a"
    head "https://github.com/kiliankoe/location.git"

    depends_on :xcode

    def install
        build_path = "#{buildpath}/.build/release/location"
        ohai "Building location"
        system("swift build --disable-sandbox -c release --static-swift-stdlib")
        bin.install build_path
    end
end
