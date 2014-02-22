package net.sklorz.cop {
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	/**
	 * Basic component to implement logic modules for Entities.
	 * 
	 * @author gregor@sklorz.net
	 */
	public class Component 
	{
		private static const ALL:Dictionary = new Dictionary();
		protected var _clazz:Class;
		protected var _keeper : Vector.<Keeper>;
		
		public function Component() : void 
		{
			_clazz = Class(getDefinitionByName(getQualifiedClassName(this)));
			_keeper = new Vector.<Keeper>();
			
			if(!ALL[_clazz])
			{
				ALL[_clazz] = new Vector.<Component>();
			}
			 
			Vector.<Component>(ALL[_clazz]).push(this);
		}
		
		/**
		 * Returns a Vector.<_clazz> of all created Instances of this Class.
		 * Since still no generics are supported by AS3, it cant be pre-casted... Someone have a better idea?
		 */
		public function get all() : Vector.<Component> 
		{
			return Vector.<Component>(ALL[_clazz]);
		}

		/**
		 * The current keeper which keeps the component currently.
		 */
		public function addKeeper(keeper:Keeper) : void 
		{
			_keeper.push(keeper);
		}
		
		/**
		 * The current keeper which keeps the component currently.
		 */
		public function removeKeeper(keeper:Keeper) : void 
		{
			var i:int = _keeper.indexOf(keeper);
			
			if(i < 0)
			{
				trace("No keeper " + keeper.clazz + " found in " + clazz );
				return;
			}
			
			_keeper.splice(i, 1);
		}
		
		/**
		 * The current entity which keeps the component currently.
		 */
		public function get keeper() : Vector.<Keeper> 
		{
			return _keeper;
		}
		
		/**
		 * The class type of this component.
		 */
		public function get clazz() : Class 
		{
			return _clazz;
		}
		
		/**
		 * Removes Component from all keepers.
		 */
		public function dispose() : void 
		{
			var vtmp:Vector.<Component> = Vector.<Component>(ALL[_clazz]);
			
			_keeper.length = 0;
			vtmp.splice(vtmp.indexOf(keeper), 1);
		}
	}
}
