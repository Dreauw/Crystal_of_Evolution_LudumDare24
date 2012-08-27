package {
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	import net.flashpunk.Engine;
	import worlds.WorldTitle;
	import worlds.WorldGame;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Dreauw
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Engine {
		public function Main() {
			super(640, 480, 60, false);
			FP.world = new WorldTitle;
			//FP.console.enable();
			//FP.console.toggleKey = Key.F1;
			FP.screen.scale = 2;
		}
	}

}