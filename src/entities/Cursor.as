package entities {
	import entities.towers.TowerBase;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import utils.Resource;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image
	import flash.ui.Mouse;
	import worlds.WorldGame;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class Cursor extends Entity {
		public var towerIndex:Number = -1;
		public var towerIndexMax:Number = 0;
		private var canPlace:Boolean = false;
		private var lastTower:TowerBase;
		public function Cursor() {
			type = "cursor";
			setCursor(-2);
			super(FP.screen.mouseX, FP.screen.mouseY);
		}
		
		public function setCursor(index:Number):void {
			if (!index) return;
			if (index == towerIndex) return;
			var img:Image
			if (index <= 1) {
				img = null;
				setHitbox(1, 1);
			} else {
				towerIndexMax = 0;
				for each(var key:* in Resource.TOWER_LVL[(world as WorldGame).lvl-1]) { 
					towerIndexMax++; 
				}
				if (index-1 > towerIndexMax) return;
				img = new Image(Resource.TOWER_LVL[(world as WorldGame).lvl-1][index - 2][1]);
				mask = Resource.TOWER_LVL[(world as WorldGame).lvl-1][index - 2][0].getMask();
			}
			towerIndex = index;
			graphic = img;
		}
		
		public function createTower():void {
			if (towerIndex <= 1) return;
			var or:uint = (world as WorldGame).or;
			if (or < Resource.TOWER_LVL[(world as WorldGame).lvl-1][towerIndex - 2][0].price) return;
			(world as WorldGame).or -= Resource.TOWER_LVL[(world as WorldGame).lvl-1][towerIndex - 2][0].price;
			(world as WorldGame).updateHud();
			world.add(new (Resource.TOWER_LVL[(world as WorldGame).lvl-1][towerIndex-2][0])(x, y));
		}
		
		public function moveCameraX(nbr:Number):void {
			if ((FP.camera.x + nbr) >= 0) {
				FP.camera.x += nbr;
				if ((FP.camera.x + FP.screen.width / FP.screen.scale) > (world as WorldGame).map.screenWidth()) {
					FP.camera.x = (world as WorldGame).map.screenWidth() - FP.screen.width / FP.screen.scale;
				}
			}
		}
		
		public function moveCameraY(nbr:Number):void {
			if ((FP.camera.y + nbr) >= 0) {
				FP.camera.y += nbr;
				if ((FP.camera.y + FP.screen.height / FP.screen.scale) > (world as WorldGame).map.screenHeight()) {
					FP.camera.y = (world as WorldGame).map.screenHeight() - FP.screen.height / FP.screen.scale;
				}
			}
		}
		
		override public function update():void {
			if (towerIndex == -2) setCursor(2);
			if (towerIndex > 1) {
				var tileWidth:uint = (world as WorldGame).map.tileWidth
				var tileHeight:uint = (world as WorldGame).map.tileWidth
				x = Math.round((FP.screen.mouseX+FP.camera.x)/tileWidth)*tileWidth - (graphic as Image).width/2;
				y = Math.round((FP.screen.mouseY + FP.camera.y - (graphic as Image).height/2) / tileHeight) * tileHeight;
			} else {
				x = (FP.screen.mouseX + FP.camera.x);
				y = (FP.screen.mouseY + FP.camera.y);
			}
			if (Input.check(Key.RIGHT)) moveCameraX(4); // (x - FP.camera.x) * FP.screen.scale > (FP.screen.width - 20)
			if (Input.check(Key.LEFT)) moveCameraX(-4); // (x - FP.camera.x) * FP.screen.scale < 20
			if (Input.check(Key.DOWN)) moveCameraY(4); // (y - FP.camera.y) * FP.screen.scale > (FP.screen.height - 20)
			if (Input.check(Key.UP)) moveCameraY(-4); // (y - FP.camera.y) * FP.screen.scale < 20
			if (Input.released(Key.DIGIT_1)) setCursor(2);
			if (Input.released(Key.DIGIT_2)) setCursor(3);
			if (Input.released(Key.DIGIT_3)) setCursor(4);
			if (Input.released(Key.DIGIT_4)) setCursor(5);
			if (Input.released(Key.DIGIT_5)) setCursor(6);
			if (Input.released(Key.DIGIT_6)) setCursor(7);
			var tower:TowerBase = collide("tower", x, y) as TowerBase;
			if (towerIndex > 1) {
				if ((collide("solid", x, y) || !collide("solid", x, y+tileHeight) || tower) && towerIndex > 0) {
					canPlace = false;
					if (towerIndex > 0) (graphic as Image).color = 0xFF0000;
				} else {
					canPlace = true;
					if (towerIndex > 0) (graphic as Image).color = 0xFFFFFF;
				}
			} else if (tower) {
				if ((world as WorldGame).towerInformer.text == "") {
					(world as WorldGame).towerInformer.text = tower.stats();
					(world as WorldGame).towerInformer.x = tower.x;
					(world as WorldGame).towerInformer.y = tower.y + tower.height ;
				}
				if (towerIndex == -1 && Input.mouseReleased) tower.sell();
				if (towerIndex == 1 && Input.mouseReleased) tower.upgrade();
				(tower.graphic as Image).color = 0x00FF00;
				if (lastTower && lastTower != tower) {
					(world as WorldGame).towerInformer.text = "";
					(lastTower.graphic as Image).color = 0xFFFFFF;
				}
				lastTower = tower;
			} else if (lastTower) {
				(world as WorldGame).towerInformer.text = "";
				(lastTower.graphic as Image).color = 0xFFFFFF
				lastTower = null;
			}
			if (towerIndex >= 1 && Input.mouseReleased && canPlace) createTower();
			super.update();
		}
		
	}

}