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
		private var components:Dictionary = new Dictionary();
		
		public function Keeper()
		{
			super();
		}
		
		/**
		 * Adds a further component to this Keeper.
		 */
		public function addComponent(comp:Component):void
		{
			if(!components[comp.clazz])
			{
				components[comp.clazz] = new Vector.<Component>();
			}
			
			comp.addKeeper(this);
			Vector.<Component>(components[comp.clazz]).push(comp);
		}
		
		/**
		 * Removes a component from this Keeper.
		 */
		public function removeComponent(comp:Component):void
		{
			var comps : Vector.<Component>;
			
			if(!components[comp.clazz])
			{
				trace("No Component " + comp.clazz + " exists in " + clazz );
				return;
			}
			
			comps = Vector.<Component>(components[comp.clazz]);
			
			if(comps.indexOf(comp) < 0)
			{
				trace("No Component " + comp.clazz + " exists in " + clazz );
				return;
			}
			
			comp.removeKeeper(this);
			comps.splice(comps.indexOf(comp), 1);
		}
		
		/**
		 * Returns the called component by type from the keeper.
		 */
		 public function getComponents(type:Class):Vector.<Component>
		 {
			if(!components[type] || Vector.<Component>(components[type]).length == 0)
			{
				trace("No component " + type + " found in " + clazz );
				return null;
			}
			
			return components[type];
		 }
		 
		/**
		 * Removes Component from all keepers.
		 */
		public override function dispose() : void 
		{
			super.dispose();
			
			for (var type in components) 
			{
				Vector.<Function>(components[type]).length = 0;
				delete components[type];
			}
		}
	}
}
