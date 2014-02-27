package net.sklorz.test {
	import net.sklorz.cop.Keeper;
	import net.sklorz.cop.Component;
	import flexunit.framework.Assert;

	public class ComponentTest {
		private var c : Component;
		private var comp : Comp;
		private var k1 : Keeper;
		private var k2 : Keeper;
		
		[BeforeClass]
		public static function construct() : void 
		{
		}

		[AfterClass]
		public static function destroy() : void 
		{
		}

		[Before]
		public function setUp() : void 
		{
			c = new Component(); //Mock
			comp = new Comp();
			k1 = new Keeper(); //Stub
			k2 = new Keeper(); 
		}

		[After]
		public function tearDown() : void 
		{
			c.dispose();
			comp.dispose();
			k1.dispose();
			k2.dispose();
			
			c = null; //Mock
			comp = null;
			k1 = null; //Stub
			k2 = null; 
		}

		[Test]
		public function instances_in_ALL() : void 
		{
			//TODO: Check dispose & ALL.addition
			Assert.assertEquals(1, c.all.length);
			Assert.assertEquals(2, k1.all.length);
			Assert.assertEquals(1, comp.all.length);
		}
		
		[Test]
		public function clazz_is_real_Class() : void 
		{
			Assert.assertEquals(Comp, comp.clazz);
		}
		
		[Test]
		public function adding1_Keeper_List() : void 
		{
			k1.addComponent(c);
			
			Assert.assertEquals(c.keeper.length, 1);
			
			k2.addComponent(c);
			
			Assert.assertEquals(c.keeper.length, 2);
		}
		
		[Test]
		public function adding_same_Keeper_List() : void
		{
			k1.addComponent(c);
			
			Assert.assertEquals(c.keeper.length, 1);
			
			k1.addComponent(c);
			
			Assert.assertEquals(c.keeper.length, 1);
		}
		
		[Test]
		public function sureTest() : void {
			Assert.assertTrue(true, true);
		}
	}
}
