window.onload = function(){
	var flag = document.getElementById('flag');
	drawFlag( flag, 100, 0, 20 );
	var timer = waveFlag( flag, 20, 10, 150, 200, -0.1 );
};

function drawFlag( canvas, width, padX, padY ){
	if (!padX) padX = 0;
	if (!padY) padY = 0;

	var a = width / 1.9;
	var b = width;

	canvas.width  = b+2*padX;
	var ctx = canvas.getContext('2d');

	ctx.fillStyle = '#900';
	ctx.fillRect(padX,padY,b,a);

	ctx.strokeStyle = 'rgba(0,0,0,0.5)';
	ctx.lineWidth = 2.5;
	ctx.strokeRect( padX, padY, b, a );
}

function waveFlag( canvas, wavelength, amplitude, period, shading, squeeze ){
	if (!squeeze)    squeeze    = 0;
	if (!shading)    shading    = 100;
	if (!period)     period     = 200;
	if (!amplitude)  amplitude  = 10;
	if (!wavelength) wavelength = canvas.width/10;

	var fps = 30;
	var ctx = canvas.getContext('2d');
	var   w = canvas.width, h = canvas.height;
	var  od = ctx.getImageData(0,0,w,h).data;

	return setInterval(function(){
		var id = ctx.getImageData(0,0,w,h);
		var  d = id.data;
		var now = (new Date)/period;
		for (var y=0;y<h;++y){
			var lastO=0,shade=0;
			var sq = (y-h/2)*squeeze;
			for (var x=0;x<w;++x){
				var px  = (y*w + x)*4;
				var pct = x/w;
				var o   = Math.sin(x/wavelength-now)*amplitude*pct;
				var y2  = y + (o+sq*pct)<<0;
				var opx = (y2*w + x)*4;
				shade = (o-lastO)*shading;
				d[px  ] = od[opx  ]+shade;
				d[px+1] = od[opx+1]+shade;
				d[px+2] = od[opx+2]+shade;
				d[px+3] = od[opx+3];
				lastO = o;
			}
		}
		ctx.putImageData(id,0,0);		
	},1000/fps);
}