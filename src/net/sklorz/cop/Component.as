package net.sklorz.cop {
	/**
	 * Basic component to implement logic modules for Entities.
	 * 
	 * @author gregor
	 */
	public class Component 
	{
		public static const ALL:Vector.<Keeper> = new Vector.<Keeper>();
		protected var _id : String;
		protected var _keeper : Keeper;
		
		public function Component(id:String) : void 
		{
			_id = id;
			ALL.push(this);
		}

		/**
		 * The current entity which keeps the component currently.
		 */
		public function set keeper(entity:Keeper) : void 
		{
			_keeper = entity;
		}
		
		/**
		 * The type id of this component.
		 */
		public function get id() : String 
		{
			return _id;
		}
	}
}
