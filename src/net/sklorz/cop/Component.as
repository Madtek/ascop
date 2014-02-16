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
		protected var _keeper : Vector.<Keeper>;
		
		public function Component(id:String) : void 
		{
			_id = id;
			_keeper = new Vector.<Keeper>();
			ALL.push(this);
		}

		/**
		 * The current keeper which keeps the component currently.
		 */
		internal function addKeeper(keeper:Keeper) : void 
		{
			_keeper.push(keeper);
		}
		
		/**
		 * The current keeper which keeps the component currently.
		 */
		internal function removeKeeper(keeper:Keeper) : void 
		{
			var i:int = _keeper.indexOf(keeper);
			
			if(i < 0)
			{
				trace("No keeper [" + keeper.id + "] found in [" + id + "]");
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
		 * The type id of this component.
		 * Could be an static property since it should be definde class wise. But want to force a id definition.
		 */
		public function get id() : String 
		{
			return _id;
		}
	}
}
