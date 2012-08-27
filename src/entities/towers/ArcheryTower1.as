package entities.towers {
	import entities.enemies.EnemyBase;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Hitbox;
	import net.flashpunk.masks.Masklist;
	import utils.Resource;

	public class ArcheryTower1 extends TowerBase {
		public static var price:uint = 20;
		public function ArcheryTower1(x:Number, y:Number) {
			super(x, y);
			graphic = new Image(Resource.ARCHERY_TOWER_1);
			mask = getMask();
			orealX = (graphic as Image).width / 2;
			orealY = (graphic as Image).height / 2;
			reloadTime = 0.3;
			power = 1;
			shootDistance = 30;
		}
		
		static public function getMask():Masklist {
			var maskList:Masklist = new Masklist;
			maskList.add(new Hitbox(24, 20, 0, 0));
			maskList.add(new Hitbox(9, 20, 6, 28));
			return maskList;
		}
		
		static public function getDescription():String {
			return "Fast but low dammage\nPrice : "+ArcheryTower1.price.toString()+"PO";
		}
	}
}