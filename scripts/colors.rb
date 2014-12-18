#!/usr/bin/env ruby
# simple script to generate colors.sh by dumping the colorize constants
require 'colorize'

String.colors.permutation(2).each do |background, color|
  puts "#{color}_on_#{background}() {"
  sample_text = "$@"
  puts "printf #{sample_text.colorize(:color => color, :background => background).inspect}"
  puts "}"
end

puts "color_matrix() {"
String.colors.permutation(2).each do |background, color|
  puts "  #{color}_on_#{background} '#{color}_on_#{background}\\n' "
end
puts "}"