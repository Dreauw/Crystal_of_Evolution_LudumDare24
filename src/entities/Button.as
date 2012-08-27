package entities {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import utils.Resource;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;

	public class Button extends Entity {
		private var text:Text;
		private var img:Image;
		private var callBack:Function;
		public function Button(x:Number, y:Number) {
			super(x, y);
			img = new Image(Resource.BUTTON);
			setHitbox(img.width, img.height);
			graphic = img;
			text = new Text("");
			text.size = 8;
			text.color = 0x777777;
			addGraphic(text);
			graphic.scrollX = graphic.scrollY = 0;
		}
		
		public function setLabel(str:String):void {
			text.text = str;
			text.x = (img.width - text.textWidth)/2;
		}
		
		public function setCallBack(func:Function):void {
			callBack = func;
		}
		
		
		override public function update():void {
			super.update();
			if (FP.screen.mouseX >  x && FP.screen.mouseX <  x+width &&
			FP.screen.mouseY >  y && FP.screen.mouseY <  y+height) {
				if (Input.mouseReleased && callBack != null) callBack.call();
				text.color = 0x555555;
			} else {
				text.color = 0x777777;
			}
		}
		
	}

}