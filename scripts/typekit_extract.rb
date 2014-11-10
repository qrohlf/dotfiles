#!/usr/bin/env ruby

require 'rubygems'
require 'active_support/core_ext/hash/conversions'

ENTITLEMENTS = ENV['HOME']+"/Library/Application Support/Adobe/CoreSync/plugins/livetype/.c/entitlements.xml"

FONTS_PATH = ENV['HOME']+"/Library/Application Support/Adobe/CoreSync/plugins/livetype/.r"

fonts = Hash.from_xml(File.read(ENTITLEMENTS))["typekitSyncState"]["fonts"]

Dir.mkdir("typekit_fonts") unless Dir.exists?("typekit_fonts")

fonts.each do |font|
  puts font["id"] + ' - ' + font["properties"]["fullName"]
  font_path = FONTS_PATH+"/.#{font['id']}.otf";
  FileUtils.copy(font_path, 'typekit_fonts/'+font["properties"]["fullName"]+'.otf')
end