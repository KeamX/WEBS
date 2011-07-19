##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CactuShop" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-19
version "0.1"
description "ASP and ASP.NET SEO optimized database-driven e-commerce storefront software. - Homepage: http://www.cactushop.com/"

# ShodanHQ results as at 2011-07-19 #
# 17 for CactuShop

# Google results as at 2011-07-19 #
# 132 for "Cactusoft International FZ-LLC & Cactusoft Ltd All rights reserved"

# Dorks #
dorks [
'"Cactusoft International FZ-LLC & Cactusoft Ltd All rights reserved"'
]

# Examples #
examples %w|
www.cactushop.com/cs6/
www.teknic.bikersworldshops.co.uk
cubixtrading.com
www.ceramichairirons.co.uk
redeyewholesale.com
www.ccw-tools.com
www.cheerssports.com
www.contemporarytouches.com/shop/
www.amp-starters.co.uk
www.hair-care.co.uk
www.secure-ipay.com/bammot/
www.ndme-demo-2.nl
theheritagemarket.com/cactushop6_standard/
63.135.105.141
66.203.150.70
|

# Matches #
matches [

# select name="numCurrencyID"
{ :text=>'<select name="numCurrencyID" class="currencymenu" onchange="javascript:document.getElementById(\'currmenuform\').submit();">' },

# HTML Comment
{ :certainty=>75, :regexp=>/<!-- MYDEVLICNUM -->/ },

# Version Detection # HTML Comment
{ :version=>/<!-- CactuShop v\.?([^\s]+) license: [\s]+ -->/ },

# Version Detection # HTML Comment
{ :version=>/<!---?[\s]+===============================================================================[\s]+CACTUSHOP v?([^\s]+) ASP SHOPPING CART/ },

]

# Passive #
def passive
	m=[]

	# CactuShop Cookie
	if @meta["set-cookie"] =~ /CactuShop[\d]+lang=numLanguageID=/ and @meta["set-cookie"] =~ /CactuShop[\d]+=numCurrencyID=/
		m << { :name=>"CactuShop cookies" }
	end

	# Return passive matches
	m
end
end

