#!/usr/bin/env ruby

words = File.read('/usr/share/dict/words').split("\n")

n = 4 unless (n = ARGV[0].to_i) > 1

puts Array.new(n).map{words.sample}.join(" ")