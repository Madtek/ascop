package net.sklorz.test{
	import net.sklorz.cop.Component;
	import net.sklorz.cop.Keeper;
	import flexunit.framework.Assert;

	public class KeeperTest {
		private var k : Keeper;
		private var c1 : Component;
		private var c2 : Component;
		private var comp : Comp;
		
		[BeforeClass]
		public static function construct() : void {
		}

		[AfterClass]
		public static function destroy() : void {
		}

		[Before]
		public function setUp() : void {
			k = new Keeper();//Mock
			c1 = new Component();//Stub
			c2 = new Component();
			comp = new Comp();
		}

		[After]
		public function tearDown() : void {
			k.dispose();
			c1.dispose();
			c2.dispose();
		}

		[Test]
		public function add_and_get_Instance() : void {
			k.addComponent(c1);
			k.addComponent(c2);
			k.addComponent(comp);
			
			Assert.assertEquals(c1, k.getComponents(Component)[0]);
			Assert.assertEquals(comp, k.getComponents(Comp)[0]);
		}
		
		[Test]
		public function remove_and_get_Instance() : void {
			k.addComponent(c1);
			k.addComponent(c2);
			k.addComponent(comp);
			k.removeComponent(c2);
			k.removeComponent(c1);
			
			Assert.assertNull( k.getComponents(Component) );
		}
		
		[Test]
		public function add2_and_get_Instance() : void {
			k.addComponent(c1);
			k.addComponent(c2);
			k.addComponent(comp);
			
			Assert.assertEquals( 2, k.getComponents(Component).length );
		}
	}
}
