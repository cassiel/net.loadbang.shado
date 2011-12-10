//	$Id: BinaryRendererTest.java,v 4d9106ce40d8 2011/05/22 15:13:20 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/unit-tests/net/loadbang/shado/BinaryRendererTest.java,v $

package net.loadbang.shado;

import static org.hamcrest.Matchers.*;
import org.jmock.Expectations;
import org.jmock.Mockery;
import org.jmock.integration.junit4.JMock;
import org.jmock.integration.junit4.JUnit4Mockery;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(JMock.class)
public class BinaryRendererTest {
	private Mockery itsContext = new JUnit4Mockery();
	
	@Test
	public void renderSinglePixel() throws Exception {
		final IRenderable f = itsContext.mock(IRenderable.class);
		final IBinaryOutputter outputter = itsContext.mock(IBinaryOutputter.class);

		itsContext.checking(new Expectations() {{
			one(f).getRenderedLamp(0, 0); will(returnValue(1f));
			one(outputter).outputRow(0, 1L);
		}});
		
		BinaryRenderer r = new BinaryRenderer(1, 1, outputter);
		r.render(f);
	}
	
	public interface IRenderable2 extends IRenderable { }
	public interface IRenderable3 extends IRenderable { }

	@Test
	public void suppressesDuplicateRow() throws Exception {
		final IRenderable f1 = itsContext.mock(IRenderable2.class);
		final IRenderable f2 = itsContext.mock(IRenderable3.class);
		final IBinaryOutputter outputter = itsContext.mock(IBinaryOutputter.class);

		itsContext.checking(new Expectations() {{
			one(f1).getRenderedLamp(0, 0); will(returnValue(1f));
			one(f1).getRenderedLamp(0, 1); will(returnValue(1f));
			one(f1).getRenderedLamp(0, 2); will(returnValue(0f));

			one(f2).getRenderedLamp(0, 0); will(returnValue(1f));
			one(f2).getRenderedLamp(0, 1); will(returnValue(0f));
			one(f2).getRenderedLamp(0, 2); will(returnValue(1f));

			one(outputter).outputRow(0, 1L);
			one(outputter).outputRow(1, 1L);
			one(outputter).outputRow(2, 0L);

			one(outputter).outputRow(1, 0L);
			one(outputter).outputRow(2, 1L);
		}});
		
		BinaryRenderer r = new BinaryRenderer(1, 3, outputter);
		r.render(f1);
		r.render(f2);
	}

	@Test
	public void sixtyFourBitTest() throws Exception {
		final IRenderable f1 = itsContext.mock(IRenderable2.class);
		final IBinaryOutputter outputter = itsContext.mock(IBinaryOutputter.class);

		itsContext.checking(new Expectations() {{
			atLeast(1).of(f1).getRenderedLamp(with(any(int.class)), with(any(int.class)));
			will(returnValue(1f));

			one(outputter).outputRow(0, 0xFFFFFFFFFFFFFFFFL);
		}});
		
		BinaryRenderer r = new BinaryRenderer(64, 1, outputter);
		r.render(f1);
	}
	@Test
	public void sixtyFourBitClean() throws Exception {
		final IRenderable f1 = itsContext.mock(IRenderable2.class);
		final IBinaryOutputter outputter = itsContext.mock(IBinaryOutputter.class);

		itsContext.checking(new Expectations() {{
			one(f1).getRenderedLamp(with(equal(63)), with(any(int.class)));
			will(returnValue(1f));
			atLeast(1).of(f1).getRenderedLamp(with(lessThan(63)), with(any(int.class)));
			will(returnValue(0f));

			one(outputter).outputRow(0, 0x8000000000000000L);
		}});
		
		BinaryRenderer r = new BinaryRenderer(64, 1, outputter);
		r.render(f1);
	}
}
