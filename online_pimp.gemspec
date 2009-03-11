# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{online_pimp}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mathieu Martin"]
  s.date = %q{2009-03-11}
  s.default_executable = %q{op}
  s.description = %q{see at a glance whether the business/product/user name you're thinking of is available here and there}
  s.email = %q{webmat@gmail.com}
  s.executables = ["op"]
  s.files = ["VERSION.yml", "bin/op", "lib/online_pimp", "lib/online_pimp/verificators", "lib/online_pimp/verificators/base.rb", "lib/online_pimp/verificators/delicious.rb", "lib/online_pimp/verificators/domain.rb", "lib/online_pimp/verificators/flickr.rb", "lib/online_pimp/verificators/github.rb", "lib/online_pimp/verificators/template.rb.erb", "lib/online_pimp/verificators/twitter.rb", "lib/online_pimp.rb", "test/online_pimp_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/webmat/online_pimp}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{see at a glance whether the business/product/user name you're thinking of is available here and there}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
