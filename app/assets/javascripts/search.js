document.addEventListener("turbolinks:load",function(){
   let $input=$("#srch-term");

    var options={
        getValue: "location",
        url: function(p){
            return "/home/search.json?term="+p;
        }
    }
    
    $input.easyAutocomplete(options);
});
