def run(files, build_cmd: nil, lang: nil, prog: nil, run_cmd: nil, **opts)
  files ||= opts[:files]
  src = "src/#{files}"

  if build_cmd
    puts "building #{files}"
    system("#{build_cmd} #{src}")
  end

  lang ||= files.split('.')[-1]
  prog ||= files.split('.')[-2]
  puts "runing #{lang} program: #{prog}"
  puts `#{run_cmd}`
  puts
end

`mkdir -p bin`

demo = {
  "prime.c": ['gcc -o bin/prime_c -O3', 'bin/prime_c'],
  "prime.rs": ['rustc -o bin/prime_rs -O', 'bin/prime_rs'],
  "prime.cr": ['crystal build -o bin/prime_cr --release', 'bin/prime_cr'],
  "prime.go": ['go build -o bin/prime_go', 'bin/prime_go'],
  "prime.nim": ['nim c -o:bin/prime_nim -d:release', 'bin/prime_nim'],
  "prime.rb": [nil, 'ruby src/prime.rb']
}

demo.each do |files_sym, arr|
  b = arr[0]
  r = arr[1]

  run(files_sym.to_s, build_cmd: b, run_cmd: r)
end
