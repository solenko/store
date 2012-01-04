//jQuery(function($){
//    // Bind handler to click event
//    $("a.remove-fields").click(function(e){
//        var $this = $(this);
//        $this.prev("input[type=hidden]").val("1");
//        $this.closest(".fields").hide();
//        // Prevent default behavior
//        e.preventDefault();
//    });
//});
//var remove_fields;

jQuery(function($){
  remove_fields = function(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
    $(link).remove();
}

  add_fields = function(link, association, content) {
        var new_id = new Date().getTime();
        var regexp = new RegExp("new_" + association, "g");
        $(link).parent().before(content.replace(regexp, new_id));
}
});
