package entities.enemies {
	import net.flashpunk.graphics.Spritemap;
	import utils.Resource;
	

	public class DinoMan1 extends EnemyBase {
		private var sprite : Spritemap;
		public function DinoMan1(x:Number, y:Number) {
			super(x, y);
			sprite = new Spritemap(Resource.DINO_MAN_1, 34, 25);
			sprite.add("run", [0, 1, 0, 2], 5, true);
			sprite.play("run");
			graphic = sprite;
			setHitbox(34, 25);
			speed = 10;
			gold = life = 12;
			maxVelocity.x = 30;
		}
	}

}