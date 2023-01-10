require 'bundler'
Bundler.require

%w[models routes].each do |dir|
  $LOAD_PATH << File.expand_path('.', File.join(File.dirname(__FILE__), dirr))
  require File.join(dir, 'init')
end
