package entities.enemies {
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.World;
	import utils.Resource;
	import worlds.WorldGame;
	

	public class Boss1 extends EnemyBase {
		private var sprite : Spritemap;
		public function Boss1(x:Number, y:Number, flipped:Boolean = false) {
			super(x, y, flipped);
			sprite = new Spritemap(Resource.BOSS_1, 34, 17);
			sprite.add("run", [0, 1, 0, 2], 5, true);
			sprite.play("run");
			sprite.flipped = flipped;
			graphic = sprite;
			setHitbox(34, 17);
			speed = 10;
			gold = life = 40;
			maxVelocity.x = 35;
		}
		
		override public function destroy(byCrystal:Boolean = false):void {
			super.destroy(byCrystal);
			if ((world as WorldGame).lvl == 1) (world as WorldGame).canEvoluate();
		}
	}

}