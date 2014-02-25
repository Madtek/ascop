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
			
			Assert.assertEquals(c1, k.getComponents(Component)[0]);
		}
	}
}
