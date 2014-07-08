// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.datetimepicker
//= require jquery.dataTables.min
//= require jquery.cleditor.min
//= require_tree .

setTimeout("$('#flash_notices').html(' ');", 5000);
function hudMsg(type, message, timeOut) {
        $('.hudmsg').remove();
        if (!timeOut) {
            timeOut = 3000;
        }
        var timeId = new Date().getTime();
        if (type != '' && message != '') {
            $('<div style="z-index: 99999;" class="hudmsg ' + type + '" id="msg_' + timeId + '"><img src="/assets/msg_' + type + '.png" alt="" />' + message + '</div>').hide().appendTo('body').fadeIn();
            var timer = setTimeout(
                    function () {
                        $('.hudmsg#msg_' + timeId + '').fadeOut('slow', function () {
                            $(this).remove();
                        });
                    }, timeOut
            );
        }
    }

