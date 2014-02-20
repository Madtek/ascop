package net.sklorz.cop {
	import flash.utils.Dictionary;
	/**
	 * Basic component to seperate logic. 
	 * Keeper of Components.
	 * 
	 * @author gregor@sklorz.net
	 */
	public class Keeper extends Component
	{		
		private const components:Dictionary = new Dictionary();
		
		public function Keeper(id:String)
		{
			super(id);
		}
		
		/**
		 * Adds a further component to this Keeper.
		 */
		public function addComponent(comp:Component):void
		{
			if(!comp.id)
			{
				trace("Adding uninitilized component not allowed. [" + id + "]");
				return;
			}
			
			if(!components[comp.id])
			{
				components[comp.id] = new Vector.<Component>();
			}
			
			comp.addKeeper(this);
			Vector.<Component>(components[comp.id]).push(comp);
		}
		
		/**
		 * Removes a component from this Keeper.
		 */
		public function removeComponent(comp:Component):void
		{
			var comps : Vector.<Component>;
			
			if(!components[comp.id])
			{
				trace("No Component [" + comp.id + "] exists in [" + id + "]");
				return;
			}
			
			comps = Vector.<Component>(components[comp.id]);
			
			if(comps.indexOf(comp) < 0)
			{
				trace("No Component [" + comp.id + "] exists in [" + id + "]");
				return;
			}
			
			comp.removeKeeper(this);
			comps.splice(comps.indexOf(comp), 1);
		}
		
		/**
		 * Returns the called component from the keeper.
		 */
		 public function getComponents(compID:String):Vector.<Component>
		 {
			if(!components[compID] || Vector.<Component>(components[compID]).length == 0)
			{
				trace("No component [" + compID + "] found in [" + id + "]");
				return null;
			}
			
			return components[compID];
		 }
		 
		/**
		 * Removes Component from all keepers.
		 */
		public override function dispose() : void 
		{
			super.dispose();
			
			for (var v:String in components) 
			{
				Vector.<Function>(components[v]).length = 0;
				delete components[v];
			}
		}
	}
}
