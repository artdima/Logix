Pod::Spec.new do |s|
  s.name         = "Logix"
  s.version      = "1.0.0"
  s.summary      = "Network debugging made easy"
  s.description  = <<-DESC
    Start debugging iOS network calls like a wizard, without extra code! Logix makes debugging quick and reliable.
  DESC
  s.homepage     = "https://github.com/artdima/Logix"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Dmitriy Medyannik" => "mail@artdima.ru" }
  s.social_media_url   = "https://artdima.ru"
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/artdima/Logix.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*.{swift,h,m}"
  s.swift_version = "5.0"
  s.public_header_files = "Sources/**/*.h"
  s.resource_bundles = {
    'Wormholy' => ['Sources/**/*.storyboard', 'Sources/**/*.xib', 'Sources/**/*.{css,js}']
  }
  s.frameworks  = "Foundation"
end
