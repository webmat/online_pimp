require 'rake'

DIR = File.dirname __FILE__

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "online_pimp"
    s.summary = %Q{TODO}
    s.email = "webmat@gmail.com"
    s.homepage = "http://github.com/webmat/online_pimp"
    s.description = "TODO"
    s.authors = ["Mathieu Martin"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'online_pimp'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |t|
    t.libs << 'test'
    t.test_files = FileList['test/**/*_test.rb']
    t.verbose = true
  end
rescue LoadError
  puts "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
end

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:features)
rescue LoadError
  puts "Cucumber is not available. In order to run features, you must: sudo gem install cucumber"
end

task :default => :test

namespace :verificators do
  desc "Clones the example verificator"
  task :new do
    require 'erb'
    require 'rubygems'
    require 'activesupport'
    service_name  = (ENV['NAME'] || 'new_example')

    dir           = File.join DIR, 'lib/online_pimp/verificators/'
    new_file      = dir + service_name + '.rb'
    class_code    = ERB.new( File.read(dir + 'template.rb.erb') ).result(binding)

    File.open(new_file, 'w'){|f| f.write(class_code)}
    puts new_file
  end
end
