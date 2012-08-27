package worlds 
{
	//import entities.Map;
	//import entities.Player;
	import entities.Crystal;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import utils.Particle;
	import utils.Resource;
	import utils.Audio;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Dreauw
	 */
	public class WorldTitle extends World {
		private var timer:Number = 0;
		private var text:Text;
		private var text2:Text;
		public function WorldTitle() {
			addGraphic(new Image(Resource.TITLE), 2);
			text = new Text("Click to play");
			text.size = 16;
			text.x = (FP.screen.width / 2 - text.width) / 2;
			text.y = 200;
			addGraphic(text, 2);
			text2 = new Text("Crystal of Evolution");
			text2.size = 16;
			text2.x = (FP.screen.width / 2 - text2.width) / 2;
			text2.y = 20;
			addGraphic(text2, 2);
			var crystal:Crystal = new Crystal(0, 160);
			crystal.x = (FP.screen.width / 2 - crystal.width) / 2;
			add(crystal);
			Audio.playMusic(Resource.TITLE_ZIC);
		}
		
		override public function update():void {
			if (Input.released(Key.M)) Audio.stop();
			timer -= FP.elapsed;
			if (timer <= 0) {
				timer = 0.7;
				text.visible = !text.visible
			}
			if (Input.mouseReleased) FP.world = new WorldGame();
			super.update();
		}
		
	}

}