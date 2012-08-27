package entities.towers {
	import net.flashpunk.Entity;
	import entities.enemies.EnemyBase;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Masklist;
	import worlds.WorldGame;
	import utils.Audio;

	public class TowerBase extends Entity {
		protected var shootDistance:Number = 20;
		protected var reloadTime:Number = 1;
		protected var power:uint = 1;
		protected var speedBoost:Number = 0;
		protected var poisonPower:uint = 0;
		protected var effectDuration:uint = 5;
		protected var time:Number = 0;
		protected var canFire:Boolean = true;
		public static var price:uint = 20;
		protected var orealX:uint = 0;
		protected var orealY:uint = 0;
		protected var buildTime:Number = 5;
		public function TowerBase(x:Number, y:Number) {
			super(x, y);
			layer = 2;
			type = "tower";
			Audio.registerSound("coin", "0,,0.0199,0.5728,0.16,0.6637,,,,,,,,,,,,,1,,,,,0.5", true);
			Audio.registerSound("upgrade", "0,,0.1604,,0.2506,0.441,,0.1874,,,,,,0.1061,,,,,0.7774,,,0.0985,,0.5", false);
			Audio.playSound("coin");
		}
		
		override public function update():void {
			if (buildTime > 1) {
				buildTime -= FP.elapsed;
				(graphic as Image).alpha = Math.round(255 / buildTime) / 255;
				return;
			}
			if (!canFire) {
				time += FP.elapsed;
				if (time >= reloadTime) {
					canFire = true
					time = 0;
				}
			} else {
				var enemy:EnemyBase = world.nearestToEntity("enemy", this) as EnemyBase;
				if (enemy && Math.abs(enemy.x - (x + orealX)) < shootDistance && Math.abs(enemy.y - (y + orealY)) < shootDistance) {
					enemy.hit(power);
					if (speedBoost != 0) enemy.speedBoost(effectDuration, speedBoost); 
					if (poisonPower != 0) enemy.setPoison(effectDuration, poisonPower);
					canFire = false;
				}
				
			}
			super.update();
		}
		
		static public function getMask():Masklist {
			return null;
		}
		
		static public function getDescription():String {
			return "Basic tower\nPrice : "+TowerBase.price.toString()+"PO";;
		}
		
		public function sell():void {
			world.remove(this);
			(world as WorldGame).or += price * (1 / 3);
			(world as WorldGame).updateHud();
			Audio.playSound("coin");
		}
		
		public function upgrade():void {
			Audio.playSound("upgrade");
			if ((world as WorldGame).or < 100) return;
			(world as WorldGame).or -= 100;
			(world as WorldGame).updateHud();
			if (power > 0) power += 1;
			if (effectDuration > 0) effectDuration += 1;
			if (speedBoost < 0) effectDuration -= 10;
			if (poisonPower > 0) poisonPower += 1;
		}
		
		public function stats():String {
			var str:String = "Speed : ";
			if (reloadTime < 1) {
				str += "Fast\n";
			} else if (reloadTime > 3) {
				str += "Slow\n";
			} else {
				str += "Medium\n";
			}
			if (power > 0) str += "Dammage : " + power.toString() + "\n";
			if (speedBoost < 0) str += "Slow ennemy during " + effectDuration.toString() + "s\n";
			if (poisonPower > 0) str += "Poison ennemy during " + effectDuration.toString() + "s\n";
			return str;
		}
	}

}