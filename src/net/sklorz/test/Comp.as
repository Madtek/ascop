package net.sklorz.test {
	import net.sklorz.cop.Keeper;

	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	/**
	 * @author gregor@sklorz.net
	 */
	public class Comp extends Keeper 
	{
		public function Comp() 
		{
			trace("Comp.Comp(" + Class(getDefinitionByName(getQualifiedClassName(this))) + ")");
		}
	}
}
