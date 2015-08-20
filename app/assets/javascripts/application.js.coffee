# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery

#= require bootstrap/alert
#= require bootstrap/carousel
#= require bootstrap/affix
#= require bootstrap/transition

#= require jquery_ujs
#= require turbolinks
#= require ckeditor/init
#= require_tree .

window.confisio = {}

window.confisio.live_events = () ->


$(document).ready(window.confisio.live_events)
# On turbolinks page load
$(document).on('page:load', window.confisio.live_events)