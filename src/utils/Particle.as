package utils
{
	import net.flashpunk.graphics.Emitter;
	/**
	* ...
	* @author Dreauw
	*/
	public class Particle extends Emitter{
		public static var instance : Particle;

	public function Particle() {
		super(Resource.PARTICLES, 1, 1);
		registerParticle();
	}

	private function registerParticle() : void {
		// Blood
		newType("blood", [0]);
		setAlpha("blood", 1, 0);
		setMotion("blood", 0, 0, 0.4, 360, 50, 0.4);
		setGravity("blood", 5, 10);
		// Crystal
		newType("crystal", [1]);
		setAlpha("crystal", 1, 0);
		setMotion("crystal", 0, 0, 1, 360, 50, 0.4);
	}

	public static function emit(name:String, x:Number, y:Number, nbr:Number = 1) : void {
		for (var i : Number = 0; i < nbr ; i++) {
		instance.emit(name, x, y);
	}
}

}

}