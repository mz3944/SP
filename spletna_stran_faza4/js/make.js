$(document).ready(function(){
	window.isRunning = false; 
	$(".sealLink").click(function(){     
		var $this = $(this);
		
		if (!isRunning) {
			isRunning = true;

			var requirements = $(this).closest("tr").find(".costs ul li");
			
			var infoBar = $("#info-bar-content ul li");

			for(var i = 0; i < 5; ++i) {
				if(parseInt(requirements.eq(i).text()) > parseInt(infoBar.eq(i).text())) {
					alert("You do not have enaugh resources to build this!\n");
					
					isRunning = false;
					return false;
				}
			}
			
			for(var i = 0; i < 5; ++i) {
				var curr = infoBar.eq(i);
				curr.text(parseInt(curr.text()) - parseInt(requirements.eq(i).text()));
			}
			
			var el = $(this).closest("tr").find(".nivel h4");
			var num = parseInt(el.text());

			var duration = $(this).closest("tr").find(".costs ul li").eq(5);
			var odlDuration = duration.text().split(":");		
			
			var a = false;
			function update() {
				var ss = duration.text().split(":");
				var dt = new Date();

				if(ss[2] == 0 && ss[1] == 0 && ss[0] == 0) {
					el.text(num+1);
					alert("Bulding complete! Building level is: " + el.text());
					
					dt.setHours(odlDuration[0]);
					dt.setMinutes(odlDuration[1]);
					dt.setSeconds(odlDuration[2]);
					
					var factor = $this.closest("tr").find(".costs").data("fac");

					var dt2 = new Date(dt.valueOf()*factor);
					var ts = dt2.toTimeString().split(" ")[0];
					duration.html(ts);	

					isRunning = false;
					return true;
				}
				
				dt.setHours(ss[0]);
				dt.setMinutes(ss[1]);
				dt.setSeconds(ss[2]);

				var dt2 = new Date(dt.valueOf() - 1000);
				var ts = dt2.toTimeString().split(" ")[0];
				duration.html(ts);
				setTimeout(update, 1000);            
			}	
			setTimeout(update, 1000);
		}
	});
});