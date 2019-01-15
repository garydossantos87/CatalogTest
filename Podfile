#source 'git@bitbucket.org:berepublicnetworkssl/specs.git'
#source 'https://github.com/CocoaPods/Specs.git'

# Uncomment this line to define a global platform for your project
platform :ios, '10.0'

# ignore all warnings from all pods
inhibit_all_warnings!
use_frameworks!

# Common Pods for every OnionArchitecture target
def BaseSharedPods
  pod 'BaseRxApplication'
end

workspace 'CatalogTest.xcworkspace'

target 'CatalogTest' do
    project 'CatalogTest'
    BaseSharedPods()
end
