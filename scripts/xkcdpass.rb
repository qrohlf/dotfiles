#!/usr/bin/env ruby

# password strength = 10000^4 ~= 53 bits of entropy. About 316 years at 1000 guesses/second
words = File.read(File.dirname(__FILE__)+'/../resources/google-10000-english.txt').split("\n")

n = 4 unless (n = ARGV[0].to_i) > 1

puts Array.new(n).map{words.sample}.join(" ").downcase