$(function() {

    $('.help-block').hide();

    var checkName = function(e) {
        var field = $(e.target);
        var wrapper = field.parent('div');

        if (field.val() === "") {
            wrapper.removeClass('has-default').addClass('has-error');
            wrapper.children('.help-block').show();
        } else {
            wrapper.removeClass('has-error').addClass('has-default');
            wrapper.children('.help-block').hide();
        }
    }

    var clearError = function(e) {
        var wrapper = $(e.target).parent('div');
        console.log(wrapper);
        wrapper.removeClass("has-error").addClass("has-default");
    }

    $('#cat_name').on('blur', checkName);
    $('#cat_breed').on('blur', checkName);
    $('#cat_name').on('focus', clearError);
    $('#cat_breed').on('focus', clearError);

    $("label[for='cat_tags']").hide();

});