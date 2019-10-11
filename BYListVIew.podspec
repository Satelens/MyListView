Pod::Spec.new do |spec|
  spec.platform = :ios, "10.0"
  spec.name         = 'BYListView'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/houboye/BYListView'
  spec.authors      = { 'houboye' => 'houboye@outlook.com' }
  spec.summary      = 'A listView for iOS and OS X.'
  spec.source       = { :git => 'https://github.com/houboye/BYListView.git', :tag => '0.0.1' }
  spec.source_files  = "SwiftNetwork", "BYListView/BYListView/BYListView/**/*.{h,m}"
end