package entities.towers {
	import entities.enemies.EnemyBase;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Hitbox;
	import net.flashpunk.masks.Masklist;
	import utils.Resource;

	public class StrongTower1 extends TowerBase {
		public static var price:uint = 40;
		public function StrongTower1(x:Number, y:Number) {
			super(x, y);
			graphic = new Image(Resource.STRONG_TOWER_1);
			mask = getMask();
			orealX = (graphic as Image).width / 2;
			orealY = (graphic as Image).height / 2;
			reloadTime = 5;
			power = 5;
		}
		
		static public function getMask():Masklist {
			var maskList:Masklist = new Masklist;
			maskList.add(new Hitbox(24, 20, 0, 0));
			maskList.add(new Hitbox(9, 20, 6, 28));
			return maskList;
		}
		
		static public function getDescription():String {
			return "Slow but huge dammage\nCan't shoot flying entity\nPrice : "+StrongTower1.price.toString()+"PO";
		}
	}
}