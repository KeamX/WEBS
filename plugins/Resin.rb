##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Resin" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-24
version "0.1"
description "Resin provides a reliable, fast Web server which can also be used as a load balancer - homepage: http://www.caucho.com/resin/admin/http-server.xtp"

# ShodanHQ results as at 2011-02-24 #
# 25,565 for server Resin

# Examples #
examples %w|
210.73.205.244
220.181.8.109
69.195.131.29
208.64.132.155
175.45.141.211
87.119.211.53
209.200.251.9
193.178.135.9
124.238.250.67
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta['server'].scan(/Resin\/([\d\.]+)/) } if @meta['server'] =~ /Resin\/([\d\.]+)/

	# Return passive matches
	m
end

end
