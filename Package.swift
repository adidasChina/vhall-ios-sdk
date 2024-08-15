// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "VhallAdidasSDK",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "VhallAdidasSDKTarget",
            targets: ["VhallAdidasSDKTarget"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            url: "https://github.com/AFNetworking/AFNetworking",
            .exact("4.0.1")
        ),
        .package(
            url: "https://github.com/jdg/MBProgressHUD",
            .exact("1.2.0")
        ),
        .package(
            url: "https://github.com/adimobile/Masonry",
            .exact("1.1.0-spm")
        ),
        .package(
            url: "https://github.com/SDWebImage/SDWebImage",
            .exact("5.12.1")
        ),
        .package(
            url: "https://github.com/SDWebImage/SDWebImageFLPlugin",
            .exact("0.6.0")
        ),
        .package(
            url: "https://github.com/adimobile/MJRefresh",
            .exact("3.7.2-bundle-fix")
        ),
        .package(
            url: "https://github.com/CoderMJLee/MJExtension",
            .exact("3.4.0")
        ),
        .package(
            url: "https://github.com/dzenbot/DZNEmptyDataSet",
            .branch("master")
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "VhallAdidasSDKTarget",
            dependencies: [
                "VHallAdidasSDK",
                "YYKit",
                "VHCore",
                "VHIM",
                "VhallLiveBaseApi",
                "VHLSS",
                .product(name: "AFNetworking", package: "AFNetworking"),
                .product(name: "MBProgressHUD", package: "MBProgressHUD"),
                .product(name: "Masonry", package: "Masonry"),
                .product(name: "SDWebImage", package: "SDWebImage"),
                .product(name: "SDWebImageFLPlugin", package: "SDWebImageFLPlugin"),
                .product(name: "MJRefresh", package: "MJRefresh"),
                .product(name: "MJExtension", package: "MJExtension"),
                .product(name: "DZNEmptyDataSet", package: "DZNEmptyDataSet")
            ],
            path: "VhallAdidasSDK",
            exclude: [
                "VHallAdidasSDK.framework"
            ]
        ),
        .binaryTarget(
            name: "YYKit",
            url: "https://adidasapp.3stripes.net/frameworks/ios/YYKit/1.0.9/YYKit.zip",
            checksum: "317b79632efa936c4ebba8b08834d600d1342f79a38239210cc577f187ccd3f2"
        ),
        .binaryTarget(
            name: "VHallAdidasSDK",
            url: "https://adidasjc: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@github.com/adidasjc/vhall-ios-sdk/releases/download/1.6.9/VHallAdidasSDK.xcframework.zip",
            checksum: "cdb91263cbda4d690b1211016aff58fe70ae2c67f28b05f595b948e29cb77cd7"
        ),
        .binaryTarget(
            name: "VHCore",
            url: "https://adidasjc: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@github.com/adidasjc/vhall-ios-sdk/releases/download/1.6.9/VHCore.xcframework.zip",
            checksum: "d7472eddab9460dd03d81c13a49e737aed08703883c0ce0e4a799523bc78cbe9"
        ),
        .binaryTarget(
            name: "VHIM",
            url: "https://adidasapp.3stripes.net/frameworks/ios/VHYun_IM/2.3.2/VHIM.zip",
            checksum: "4ec54055ffb98dd967861858f254b46f60d91622063e0db3a4ffa99b973844fb"
        ),
        .binaryTarget(
            name: "VHLSS",
            url: "https://adidasapp.3stripes.net/frameworks/ios/VHYun_LSS/2.4.3/VHLSS.zip",
            checksum: "e3228e8e3364b7e70959d03265779087a625ba4f000b9eeff2ef0a082a9e80ef"
        ),
        .binaryTarget(
            name: "VhallLiveBaseApi",
            url: "https://adidasapp.3stripes.net/frameworks/ios/VHYun_LSS/2.4.3/VhallLiveBaseApi.zip",
            checksum: "dadf9b5ba78652094e5fc12aa8bc044e355a635c847a4e2288883664d6cf163d"
        )
    ]
)
