package entities.enemies {
	import net.flashpunk.graphics.Spritemap;
	import utils.Resource;
	

	public class Man2 extends EnemyBase {
		private var sprite : Spritemap;
		public function Man2(x:Number, y:Number) {
			super(x, y);
			sprite = new Spritemap(Resource.MAN_2, 13, 14);
			sprite.add("run", [0, 1, 0, 2], 5, true);
			sprite.play("run");
			graphic = sprite;
			setHitbox(13, 14);
			gold = life = 4;
			speed = 20;
		}
	}

}