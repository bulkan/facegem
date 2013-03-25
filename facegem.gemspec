Gem::Specification.new do |s|
    s.name     = 'facegem'
    s.version  = '0.0.0'
    s.summary  = 'Ruby bindings to Facebook Graph API'
    s.authors  = ['Bulkan Evcimen']
    s.email    = 'bulkan@gmail.com'
    s.files    = ["lib/facegem.rb"]
    s.homepage = 'http://github.com/bulkan/facegem'

    s.add_dependency 'httparty', "~> 0.10.2"
end
