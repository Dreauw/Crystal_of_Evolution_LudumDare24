package entities.towers {
	import net.flashpunk.graphics.Image;
	import utils.Resource;
	import net.flashpunk.masks.Masklist;
	import net.flashpunk.masks.Hitbox;
	
	public class SlowTower1 extends TowerBase {
		public static var price:uint = 30;
		public function SlowTower1(x:Number, y:Number) {
			super(x, y);
			graphic = new Image(Resource.SLOW_TOWER_1);
			mask = getMask();
			orealX = (graphic as Image).width / 2;
			orealY = (graphic as Image).height / 2;
			reloadTime = 0.5;
			power = 0;
			speedBoost = -20;
			shootDistance = 25;
		}
		
		static public function getMask():Masklist {
			var maskList:Masklist = new Masklist;
			maskList.add(new Hitbox(24, 20, 0, 0));
			maskList.add(new Hitbox(9, 20, 6, 28));
			return maskList;
		}
		
		static public function getDescription():String {
			return "Slow ennemies\nPrice : "+SlowTower1.price.toString()+"PO";
		}
		
	}

}