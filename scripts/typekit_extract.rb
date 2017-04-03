#!/usr/bin/env ruby

require 'fileutils'
require 'rubygems'
require 'active_support/core_ext/hash/conversions'

ENTITLEMENTS = ENV['HOME']+"/Library/Application Support/Adobe/CoreSync/plugins/livetype/.c/entitlements.xml"

FONTS_PATH = ENV['HOME']+"/Library/Application Support/Adobe/CoreSync/plugins/livetype/.r"

fonts = Hash.from_xml(File.read(ENTITLEMENTS))["typekitSyncState"]["fonts"]

Dir.mkdir("typekit_fonts") unless Dir.exists?("typekit_fonts")

fonts.each do |font|
  font_path = FONTS_PATH+"/.#{font['id']}.otf"
  font_dest = 'typekit_fonts/'+font["properties"]["fullName"]+'.otf'
  FileUtils.copy(font_path, font_dest)
  puts "#{font_path} -> #{font_dest}"
end
