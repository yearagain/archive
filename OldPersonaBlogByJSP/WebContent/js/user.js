$(document).ready(function () {
    $("#userbox").css("display", "none");
    $("#login").bind("mouseover", function(){
        $("#userbox").css("display", "block");}
    );
    $("#login").bind("mouseleave", function () {
        $("#userbox").css("display", "none");}
    );
    $("#userbox").bind("mouseover", function () {
        $("#userbox").css("display", "block");
    }
    );
    $("#userbox").bind("mouseleave", function () {
        $("#userbox").css("display", "none");
    }
    );
})