var init_metal_lookup;

init_metal_lookup = function() {
    $('#metal-lookup-form').on('ajax:before', function(event, data, status) {
       show_spinner(); 
    });
    
    $('#metal-lookup-form').on('ajax:after', function(event, data, status) {
       hide_spinner(); 
    });
    
    
    $('#metal-lookup-form').on('ajax:success', function(event,data,status) {
        $('#metal-lookup').replaceWith(data);
        init_metal_lookup();
        // to repeat the listening of ajax
    });
    
    $('#metal-lookup-form').on('ajax:error', function(event, xhr, status, error) {
       hide_spinner();
        $('#metal-lookup-results').replaceWith(' ');
        $('#metal-lookup-errors').replaceWith('metal was not found.');
    });
}


$(document).ready(function(){
    init_metal_lookup();
})