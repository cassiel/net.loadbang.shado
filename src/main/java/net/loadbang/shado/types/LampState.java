//	$Id: LampState.java,v 5af4402a8455 2011/05/21 22:29:48 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/net/loadbang/shado/types/LampState.java,v $

package net.loadbang.shado.types;

/**	The state of an individual layer pixel.

	<P>In the "classic" monome, pixels can be either on or off. This led to
	a rendering model where pixels in layer blocks could be on or off, or
	transparent ("THRU"), or inverting ("FLIP") of whatever lay beneath them.
	A rendering pass would calculate the state of a stack of pixels over a
	notional black background, returning on or off.
	
	<P>In the new, variable-brightness world of the arc and the new monomes,
	hardware pixels can vary between off (0.0) and fully on (1.0), which
	obviously requires a new rendering model, backwards-compatible with
	existing code and hardware. A bit of thought leads to a model of a "lamp"
	in a layer as a combination of two values: "level" and "xform". Level is a
	lighting level from 0.0 to 1.0. Xform is a glorified alpha value: 0.0
	means opaque (the lamp state is the level value), 1.0 means totally
	transparent, and -1.0 means total inversion.
	
	<P>Combination of transparencies is obviously tricky (and it's not
	clear to me exactly how it should work). For a lamp L2 over L1, the
	result has transparency (blend) which is the signed floating product of the
	component blends, and a level which is interpolated between the underlying
	calculated level of L1 (or 1.0-L1) and the level value in L2.
	
	<P>(That's an appeal to reason: I don't know what it'll look like.)
	
	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

public class LampState {
	static public LampState OFF  = new LampState(0.0f,  0.0f);
	static public LampState ON   = new LampState(1.0f,  0.0f);
	static public LampState THRU = new LampState(0.0f,  1.0f);
	static public LampState FLIP = new LampState(0.0f, -1.0f);

	public LampState(float level, float blend) {
		itsLevel = level;
		itsBlend = blend;
	}
	
	float itsLevel, itsBlend;		//	XXX Private, but examined in unit tests.

	/**	Get the brightness state of a lamp if drawn against black (off). */
	
	public float againstBlack() {
		//return itsLevel;
		return cover(OFF).itsLevel;
	}
	
	/**	Return the result of this instance covering another instance. */

	public LampState cover(LampState lamp) {
		float level = interp(itsLevel, lamp.itsLevel, itsBlend);
		float blend = itsBlend * lamp.itsBlend;
		return new LampState(level, blend);
	}

	/**	Calculate the interpolated apparent level ("colour") when this lamp
	 	is laid over another lamp. It's an interpolation between our level
	 	and their level, according to our blend value (0.0=opaque), but
	 	with the sense of *their* level inverted if our blend is negative.
	 	
		@param ourLevel our level value
		@param theirLevel their level value
		@param ourBlend our blend value
		@return the effective level
	 */

	private static float interp(float ourLevel, float theirLevel, float ourBlend) {
		if (ourBlend < 0) {
			ourBlend = -ourBlend;
			theirLevel = 1f - theirLevel;
		}

		return (ourLevel * (1f - ourBlend) + theirLevel * ourBlend);
	}
	
	@Override
	public String toString() {
		return String.format("[level=%f blend=%f]", itsLevel, itsBlend);
	}
}
