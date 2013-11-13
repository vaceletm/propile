desc "release version defined in VERSION" 
task "release" do
  releaseline = File.readlines('VERSION').first.strip
  p releaseline
  version = releaseline[/[^\s]*/] 
  raise "Version #{version} has invalid format" unless version =~ /\d*\.\d*.\d*/
  raise "Tag #{version} was released earlier" if `git tag`.split.include?(version)
  message = "Released " + releaseline
  sh "git tag -a -m '#{message}' #{version}"
  sh 'rake vlad:deploy:migrate to=prod'
end


