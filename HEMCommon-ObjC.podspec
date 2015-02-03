Pod::Spec.new do |s|

  s.name         = 'HEMCommon-ObjC'
  s.version      = '0.0.1'
  s.summary      = 'Common classes for iOS development in HE:mobile'
  s.homepage     = 'https://github.com/HEmobile/HEMCommon-ObjC'
  s.license      = 'MIT'
  s.authors      = { 
                      'Marcilio Junior' => 'marciliojrs@gmail.com' 
                   }  
  s.source       = { 
                      :git => 'https://github.com/HEmobile/HEMCommon-ObjC.git', 
                      :branch => 'develop' 
                   }
  s.requires_arc = true
  s.platform     = :ios, '7.0'

  s.source_files = 'HEMCommon-ObjC/**/*.{h,m}'

  s.dependency 'AFNetworking'

end
