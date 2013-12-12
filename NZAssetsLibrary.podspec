Pod::Spec.new do |s|
  s.name         = 'NZAssetsLibrary'
  s.version      = '0.0.1'
  s.license      = 'MIT'
  s.summary      = 'ALAssetsLibrary extension with additional functions such as saving and loading for specific photo album...'
  s.author = {
	'Bruno Tortato Furtado' => 'bruno.furtado@gruponzn.com'
  }
  s.source = {
	:git => 'https://github.com/NZN/NZAssetsLibrary.git',
	:tag => '0.0.1'
  }
  s.ios.deployment_target = '4.0'
  s.ios.frameworks = 'AssetsLibrary'
  s.source_files = 'NZAssetsLibrary/**/*.{h,m}'
end