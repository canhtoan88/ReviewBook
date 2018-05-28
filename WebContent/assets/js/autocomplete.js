var $input = $(".typeahead");
$input.typeahead({
  source: [
    {id: "someId1", name: "jQueryScript.Net"},
    {id: "someId2", name: "Angular Components"},
    {id: "someId3", name: "React Components"},
    {id: "someId4", name: "Vue.js Components"},
    {id: "someId5", name: "Native JavaScript"},
    {id: "someId6", name: "jQuery Plugins"},
    {id: "someId7", name: "Vanilla JavaScript"}
  ],
  autoSelect: true
});
$input.change(function() {
  var current = $input.typeahead("getActive");
  if (current) {
    // Some item from your model is active!
    if (current.name == $input.val()) {
      // This means the exact match is found. Use toLowerCase() if you want case insensitive match.
    } else {
      // This means it is only a partial match, you can either add a new item
      // or take the active if you don't want new items
    }
  } else {
    // Nothing is active so it is a new value (or maybe empty value)
  }
});

var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();