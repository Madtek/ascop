package net.sklorz.cop {
	/**
	 * Basic component to implement logic modules for Entities.
	 * 
	 * @author gregor@sklorz.net
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
		 * The current keeper which keeps the component currently.
		 */
		internal function setKeeper(keeper:Keeper) : void 
		{
			_keeper = keeper;
		}
		
		/**
		 * The current entity which keeps the component currently.
		 */
		public function get keeper() : Keeper 
		{
			return _keeper;
		}
		
		/**
		 * The type id of this component.
		 * Could be an static property since it should be definde class wise. But want to force a id definition.
		 */
		public function get id() : String 
		{
			return _id;
		}
	}
}
