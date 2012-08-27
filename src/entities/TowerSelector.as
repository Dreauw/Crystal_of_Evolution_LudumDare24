package entities {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import utils.Resource;
	import net.flashpunk.utils.Input;
	import worlds.WorldGame;

	public class TowerSelector extends Entity {
		public var towerDescription:Text = new Text("");
		private var previousCursor:Number = -2;
		private var cursor:Cursor;
		private var lastIndex:Number;
		public function TowerSelector(_cursor:Cursor, lvl:uint) {
			super(0, (FP.screen.height / 2) - 20);
			if (lvl == 1) {
				graphic = new Image(Resource.TOWER_SELECTOR_1);
			} else if (lvl == 2) {
				graphic = new Image(Resource.TOWER_SELECTOR_2);
			} else {
				graphic = new Image(Resource.TOWER_SELECTOR_3);
			}
			graphic.scrollX = graphic.scrollY = 0;
			towerDescription.scrollX = towerDescription.scrollY = 0;
			addGraphic(towerDescription);
			towerDescription.size = 8;
			cursor = _cursor;
		}
		
		override public function update():void {
			super.update();
			if (cursor.towerIndex == -2) return;
			if ((FP.screen.mouseY) * FP.screen.scale > (FP.screen.height - 45)) {	
				var index:uint = FP.screen.mouseX / 30;
				if (index - 1 <= cursor.towerIndexMax && index >= 0 && index != lastIndex) {
					lastIndex = index;
					if (index == 0) {
						setDescription("Sell tower\n1/3 of the initial price");
					} else if (index == 1) {
						setDescription("Upgrade tower\nPrice : 100PO");
					} else {
						setDescription(Resource.TOWER_LVL[(world as WorldGame).lvl-1][index - 2][0].getDescription());
					}
					
				}
				if (Input.mouseReleased && lastIndex != -1 && index - 1 <= cursor.towerIndexMax && index >= 0) {
						previousCursor = lastIndex;
						return;
					}
				if (previousCursor == -2) {
					previousCursor = cursor.towerIndex;
					cursor.setCursor(-1);
				}
			} else if (previousCursor != -2) {
				cursor.setCursor(previousCursor);
				previousCursor = -2;
				setDescription("");
				lastIndex = -1;
			}
			
		}
		
		public function setDescription(text:String):void {
			towerDescription.text = text;
			towerDescription.x = lastIndex * 30;
			towerDescription.y = -(8*text.split("\n").length)-5;
		}
		
	}

}