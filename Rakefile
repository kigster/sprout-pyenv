require 'rake'

task default: %w(foodcritic)

desc 'Run foodcritic'
task :foodcritic do
  sh 'foodcritic . -f any -f ~FC015'
end

desc 'Cleanup' 
task :clean do
  sh 'rm -rf cookbooks tmp'
end
