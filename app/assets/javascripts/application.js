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
        e.preventDefault();
        $("#add-item").show();
        $($($(this).parent()[0]).parent()[0]).hide();
    });
    $("#api-call").click(function(e) {
        e.preventDefault();
        var that = this;
        $.ajax({
            url: "/items/external_api",
            method: "get"
        }).done(function(response) {
            console.log(response);
            $(that).parent().append(response);
        })
    });
    $("#keyword-search").click(function(e) {
        $("#search-form").toggleClass("hidden");
        $(this).toggleClass("hidden");
    })
    $(".show-comment-form").click(function(e) {
        e.preventDefault();
        var form = $($(this).parent()[0]).find(".comment-form")[0];
        $(form).removeClass("hidden");

    });
    // $(".keyword-search").submit(function(e) {
    //     $("#search-form").toggleClass("hidden");
    //     $("#keyword-search").toggleClass("hidden");
    //     e.preventDefault();
    //     var input = $(".keyword-search input[type='text']").val()
    //     $.ajax({
    //         url: "/items/search_by_keyword",
    //         method: "post",
    //         data: { keyword: input }
    //     }).done(function(response) {
    //         console.log($(".keyword-search input[type='submit'")[0]);
    //         $(".keyword-search input[type='submit'").prop("disabled", false);
    //         if (response["keyword"]) {
    //             var keyword = $("#if-kw")[0];
    //             var art = $(keyword).find("h2")[0];
    //             $(art).text(response["keyword"]);
    //             $(keyword).show();
    //         }
    //         console.log(response);
    //     })
    //     console.log(e.target);
    // })
    $(".hide-comment-form").click(function(e) {
        var form = $(this).parent()[0];
        debugger;
        $(form).addClass("hidden");
    })
    $(".comments-show").click(function(e) {
        e.preventDefault();
        var paren = $(this).parent()[0];
        var comments = $(paren).find(".comments-index");
        var button = $(paren).find(".comments-show");
        $(comments).show();
        $(button).hide();
        
    });
    $(".hide-comments").click(function(e) {
        var paren = $(this).closest(".coms");
        var comments = $(paren).find(".comments-index");
        var button = $(paren).find(".comments-show");
        $(comments).hide();
        $(button).show(); 
    })

})