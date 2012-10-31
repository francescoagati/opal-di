require 'bundler/setup'
require 'opal/rake_task'

Opal::RakeTask.new do |t|
  t.name = 'opal-gem'
  t.dependencies = %w[opal-spec]
end

task :default => [:opal, 'opal:test']