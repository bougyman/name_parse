desc 'Run all bacon specs with pretty output'
task :bacon => :install_dependencies do
  require 'open3'

  Open3.popen3("bacon", *PROJECT_SPECS) do |sin, sout, serr|
    out = sout.read.strip
    err = serr.read.strip
    puts out
    puts "Errors: #{err}" if err.size > 0
  end

end
