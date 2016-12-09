// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require react
//= require react_ujs
//= require components
//= require_tree 
//= require react
//= require react_ujs
//= require components
$( document ).ready(function() {
    // $(".show-comment-form").click(function(e) {
    //     e.preventDefault();
    //     var a = $(this).closest(".items-column")[0];
    //     var partial = $(a).find(".new-comment-partial")[0];
    //     $(partial).show();
    //     })
    $("#show_signup").click(function(e) {
    	$("#signup-form").show();
    	$(this).hide();
    });
    $("#show_login").click(function(e) {
    	$("#login-form").show();
    	$(this).hide();
    });
    $("#add-item").click(function(e) {
    	$("#new-item-form").show();
    	$(this).hide();
    });
    $("#hide-item-form").click(function(e) {
        // e.preventDefault();
        $(this).parent.hide();
    });
    $("#api-call").click(function(e) {
        e.preventDefault();
        var that = this;
        $.ajax({
            url: "/items/external_api",
            type: "get"
        }).done(function(response) {
            console.log(response);
            $(that).parent().append(response);
        })
    })

})