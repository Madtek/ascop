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
		private var _components:Dictionary = new Dictionary();
		
		public function Keeper()
		{
			super();
		}
		
		/**
		 * Adds a further component to this Keeper.
		 */
		public function addComponent(comp:Component):void
		{
			trace("Keeper.addComponent(" + _components[comp.clazz] + ") FOO");
			if(!_components[comp.clazz])
			{
				_components[comp.clazz] = new Vector.<Component>();
			}
			
			var comps:Vector.<Component> = Vector.<Component>(_components[comp.clazz]);
			
			if(comps.indexOf(comp) >= 0)
			{
				trace("Keeper.addComponent(" + comp + ") : Component already added.");
				return;
			}
			
			comp.addKeeper(this);
			comps.push(comp);
		}
		
		/**
		 * Removes a component from this Keeper.
		 */
		public function removeComponent(comp:Component):void
		{
			var comps : Vector.<Component>;
			
			if(!_components[comp.clazz])
			{
				trace("No Component " + comp.clazz + " exists in " + clazz );
				return;
			}
			
			comps = Vector.<Component>(_components[comp.clazz]);
			
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
			if(!_components[type] || Vector.<Component>(_components[type]).length == 0)
			{
				trace("No component " + type + " found in " + clazz );
				return null;
			}
			
			return _components[type];
		 }
		 
		/**
		 * Removes Component from all keepers.
		 */
		public override function dispose() : void 
		{
			super.dispose();
			
			for each (var vec:Vector.<Component> in _components)
			{
				vec.length = 0;
			}
			
			for (var type:Object in _components) 
			{
				delete _components[type];
			}
		}
	}
}
