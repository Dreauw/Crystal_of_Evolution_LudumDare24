package entities.enemies {
	import net.flashpunk.graphics.Spritemap;
	import utils.Resource;
	import worlds.WorldGame;
	

	public class Boss2 extends EnemyBase {
		private var sprite : Spritemap;
		public function Boss2(x:Number, y:Number, flipped:Boolean = false) {
			super(x, y, flipped);
			sprite = new Spritemap(Resource.BOSS_2, 35, 19);
			sprite.add("run", [0, 1, 0, 2], 5, true);
			sprite.play("run");
			sprite.flipped = flipped;
			graphic = sprite;
			setHitbox(35, 19);
			gold = life = 100;
			speed = 10;
			maxVelocity.x = 40;
		}
		
		override public function destroy(byCrystal:Boolean = false):void {
			super.destroy(byCrystal);
			if ((world as WorldGame).lvl == 2) (world as WorldGame).canEvoluate();
		}
	}

}