// save history for all subprojects in one location
//
historyPath := Some((ThisBuild / baseDirectory).value / ".sbthistory")
// cleanKeepFiles -= (ThisBuild / baseDirectory).value / ".history"
// historyPath := Some( (target in LocalRootProject).value / ".history")
// cleanKeepFiles -= (target in LocalRootProject).value / ".history"
