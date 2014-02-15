package net.sklorz.cop {
	import flash.utils.Dictionary;
	/**
	 * Basic component to seperate logic. 
	 * Keeper of Components.
	 * 
	 * @author gregor
	 */
	public class Keeper extends Component
	{		
		private const components:Dictionary = new Dictionary();
		
		public function Keeper(id:String = "ENTITY")
		{
			super(id);
		}
		
		/**
		 * Adds a further component to this component.
		 */
		public function addComponent(comp:Component):void
		{
			if(!comp.id)
			{
				trace("Adding uninitilized component not allowed to [" + id + "]");
				return;
			}
			
			if(components[comp.id])
			{
				trace("Component [" + comp.id + "] already added to [" + id + "]");
				return;
			}
			
			comp.keeper = this;
			components[comp.id] = comp;
		}
		
		/**
		 * Removes a component from this Entity.
		 */
		public function removeComponent(compID:String):void{
			if(!components[compID])
			{
				trace("Component [" + compID + "] not existant in [" + id + "]");
				return;
			}
			
			Component(components[compID]).keeper = null;
			delete components[compID];
		}
		
		/**
		 * Returns the called component from the this keeping Entity.
		 */
		 public function getComponent(compID:String):Keeper{
			if(!components[compID])
			{
				trace("No component [" + compID + "] found in [" + id + "]");
				return null;
			}
			
			return components[compID];
		 }
	}
}