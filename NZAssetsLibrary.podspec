Pod::Spec.new do |s|
  s.name         = 'NZAssetsLibrary'
  s.version      = '0.0.1'
  s.summary    = 'ALAssetsLibrary extension with additional functions such as saving and loading for specific photo album...'
  s.author = {
	'Bruno Tortato Furtado' => 'bruno.furtado@gruponzn.com'
  }
  s.source = {
	:git => 'https://github.com/NZN/NZAssetsLibrary.git',
	:tag => '0.0.1'
  }
  s.source_files = 'NZAssetsLibrary/*.{h,m}'
end