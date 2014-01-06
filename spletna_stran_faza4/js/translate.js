languageK = "italian";

$(function() {
	$("#language").click(function(){
		xmlDoc=loadXMLDoc("xml/languages.xml");			
		var image;
		if(languageK == "italian") {
			languageK = "english";
			image = "slo_flag.png";
		}
		else {
			languageK="italian";
			image = "usa_uk_flag.png";
		}
		$("#language").css("background-image", "url(images/" + image + ")");

		translation=xmlDoc.getElementsByTagName('translation');
		for (i=0;i<translation.length;i++) {
			var $this = translation[i].getAttribute('id');
			var mark = translation[i].getAttribute('id');
			var type = "#";
			if(!mark){
			   mark = translation[i].getAttribute('class');
			   type = ".";
			};
			var text = translation[i].getElementsByTagName(languageK)[0].childNodes[0].nodeValue; 
			var contents = $(type + mark).contents();
			if (contents.length > 0) {
				var k = contents.filter(function () {
					return this.textContent.trim().length != 0;});
				replaceTextNodes(k.get(0), text);
			}
		}
	}); 
});

function replaceTextNodes(node, newText) {
    if (node.nodeType == 3) {
		if (!/^\s*$/.test(node.data)) {
            node.data = newText;
        }
    } else if (node.hasChildNodes()) {
        for (var i = 0, len = node.childNodes.length; i < len; ++i) {
            replaceTextNodes(node.childNodes[i], newText);
        }
    }
}