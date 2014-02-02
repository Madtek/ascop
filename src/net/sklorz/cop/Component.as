package net.sklorz.cop {
	/**
	 * Basic component to implement logic modules for Entities.
	 * 
	 * @author gregor
	 */
	public class Component 
	{
		public static const ALL:Vector.<Entity> = new Vector.<Entity>();
		protected final var _id : String;
		protected var _keeper : Entity;
		
		public function Component(id:String) : void 
		{
			_id = id;
			ALL.push(this);
		}

		/**
		 * The current entity which keeps the component currently.
		 */
		public function set keeper(entity:Entity) : void 
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
