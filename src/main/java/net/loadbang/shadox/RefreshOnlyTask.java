//	$Id$
//	$Source$

package net.loadbang.shadox;

import net.loadbang.shadox.DisplayTaskManager.ScheduleTime;

/**	A task which actually does nothing, but serves to cause the
 	worker thread to do a refresh.
 */

public class RefreshOnlyTask implements IBasicTask {
	public boolean bangThenRefresh(ScheduleTime cue) { return true; }
}
