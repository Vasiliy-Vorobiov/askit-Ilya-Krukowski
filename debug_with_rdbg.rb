begin
  # system('bin/dev')
  system('exec foreman start -f Procfile_rdbg.dev "$@"')
rescue => e
  puts "loading error: #{e}"
end
