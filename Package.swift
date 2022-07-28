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
            from: "4.0.1"
        ),
        .package(
            url: "https://github.com/jdg/MBProgressHUD",
            from: "1.2.0"
        ),
        .package(
            url: "https://github.com/cntrump/Masonry",
            .branch("pr_layoutguide_support")
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
            url: "https://github.com/CoderMJLee/MJRefresh",
            .exact("3.7.5")
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
            name: "VHCore",
            url: "https://adidasapp.3stripes.net/frameworks/ios/VHCore/2.3.1/VHCore.zip",
            checksum: "00ad4c937d52880ec095e01d9f3c017f018f9b2d642185a640d12f697787a482"
        ),
        .binaryTarget(
            name: "VHIM",
            url: "https://adidasapp.3stripes.net/frameworks/ios/VHYun_IM/2.3.2/VHIM.zip",
            checksum: "4ec54055ffb98dd967861858f254b46f60d91622063e0db3a4ffa99b973844fb"
        ),
        .binaryTarget(
            name: "VHLSS",
            url: "https://adidasapp.3stripes.net/frameworks/ios/VHYun_LSS/2.5.0/VHLSS.zip",
            checksum: "001ad66de7475a174702423f8d637c3e236485a82d05e03901e1b1b973841eed"
        ),
        .binaryTarget(
            name: "VhallLiveBaseApi",
            url: "https://adidasapp.3stripes.net/frameworks/ios/VHYun_LSS/2.5.0/VhallLiveBaseApi.zip",
            checksum: "b88766cae45f9c9474282aac6b3e7fe8bb82dc0ed864885952be45eaecd63429"
        ),
        .binaryTarget(
            name: "VHallAdidasSDK",
            url: "https://adidasapp.3stripes.net/frameworks/ios/VHallAdidasSDK/2.2.1/VHallAdidasSDK.zip",
            checksum: "69860c8bbf3b09f7ed581eefe00d1fd214f51f13d60489493b2f4851bdd48af8"
        )
    ]
)
